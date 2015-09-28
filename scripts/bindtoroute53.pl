#!/usr/bin/perl -w
# Copyright 2010 Amazon Technologies, Inc.  
# Licensed under the Apache License, Version 2.0 (the "License");
# 
# You may not use this file except in compliance with the License. 
# You may obtain a copy of the License at:
#
# http://aws.amazon.com/apache2.0
#
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
# CONDITIONS OF ANY KIND, either express or implied.
#
# See the License for the specific language governing permissions and 
# limitations under the License. 

=head1 bindtoroute53.pl

bindtoroute53.pl - Convert a BIND zone file to Amazon Route 53 ChangeResourceRecordSetsRequest XML

=head1 SYNOPSIS

This script converts a BIND zone file to Amazon Route 53 ChangeResourceRecordSetsRequest XML to migrate a zone to Route 53.

Known limitations: Only parses A, AAAA, CNAME, MX, NS, SOA, TXT, PTR. Does not handle special characters (octets).  Net::DNS::ZoneFile 1.04 does not support specifying time values in short BIND format (eg. 3h), all times must be in seconds.

Dependencies: Net::DNS::ZoneFile and its dependencies

For help, try:

bindtoroute53.pl --help

Usage examples:

From zone file:
bindtoroute53.pl --ignore-origin-ns --ignore-soa --origin example.com < example.com.zone > create-request.xml

From dig:
dig @a.iana-servers.net. www.example.com. | bindtoroute53.pl --dig --origin example.com > create-request.xml

=head1 OPTIONS

=over 8

=item B<--help>

Print a help message and exits.

=item B<--origin> [origin]

Specify the zone origin. (Required)

=item B<--action> [action]

Specify the actions (CREATE or DELETE), defaults to CREATE.

=item B<--ignore-origin-ns> 

Ignore NS records for the origin in the input. 

=item B<--ignore-soa> 

Ignore SOA records in the input.

=item B<--comment> [comment]

Specify custom comment.

=item B<--dig>

Process dig output better. Also enables --ignore-soa and --ignore-origin-ns.

=back

=cut

use warnings;
use strict;
use Net::DNS::RR;
use Net::DNS::ZoneFile;
use Getopt::Long;
use Pod::Usage;

# Net::DNS:RR to Value conversion
my $TYPES = {
    A     => sub { $_[0]->address; },
    AAAA  => sub { $_[0]->address; },
    SOA   => sub { my ($r)=@_; join(" ", $r->mname.".", $r->rname.".", $r->serial,
                       $r->refresh, $r->retry, $r->expire, $r->minimum); },
    NS    => sub { $_[0]->nsdname."."; },
    TXT   => sub { "\"" . join("\" \"", $_[0]->char_str_list()) . "\""; },
    CNAME => sub { $_[0]->cname."."; },
    MX    => sub { my ($r)=@_; $r->preference ." ". $r->exchange."."; },
    PTR   => sub { $_[0]->ptrdname."."; },
    # RR types below aren't currently supported by Net::DNS::ZoneFile 
    SRV   => sub { my ($r)=@_; join(" ", $r->priority, $r->weight, $r->port,$r->target."."); },
    SPF   => sub { "\"" . join("\" \"", $_[0]->char_str_list()) . "\""; },
};

my $help      = 0;
my $ignoreNS  = 0;
my $ignoreSOA = 0;
my $action    = "CREATE";
my $origin    = "";
my $dig       = 0;
my $comment   = "This change imports a zone file";

my $options = GetOptions(
    "origin=s"          => \$origin,
    "ignore-origin-ns"  => \$ignoreNS,
    "ignore-soa"        => \$ignoreSOA,
    "dig"               => \$dig,
    "action=s"          => \$action,
    "comment=s"         => \$comment,
    "help"              => \$help,
);

if ($help or !$options) {
    pod2usage(1);
    exit;
}

if ($origin eq "") {
    print STDERR "Must specify zone origin using --origin.\n";
    exit 1;
}

if($origin =~ /\.$/) {
    # Remove trailing . to make origin simpler to work with
    chop($origin);
}

if ($dig) {
    $ignoreNS  = 1;
    $ignoreSOA = 1;
}

if ($action ne "CREATE" && $action ne "DELETE") {
    print STDERR "Action must be CREATE or DELETE.\n";
    exit 1;
}

# Convert zone file to stripped down data structure

my $zone;

eval {
    my $zonefile = new Net::DNS::ZoneFile(\*STDIN, $origin);
    $zone = [$zonefile->read];
};

if($@ || !$zone) {
    print STDERR "Unable to parse zone file: $@\n";
    exit 1;
}

my $records = {};
my $recordCount = 0;
my $totalRdataLength = 0;

foreach my $zonerr (@$zone) {
    my $name  = lc($zonerr->name);
    my $type  = $zonerr->type;
    my $class = $zonerr->class;

    if($class ne "IN") {
        print STDERR "Ignoring '" . $zonerr->string . "', only IN records supported.\n";
        next;
    }

    if($TYPES->{$type}) {
        if($ignoreSOA && $type eq "SOA") {
            print STDERR "Ignoring '" . $zonerr->string . "', --ignore-soa enabled.\n";
            next;
        }
        if(!$name) {
            # name is empty string or @ without $ORIGIN
            $name = $origin;
        }
        if($name !~ /$origin\.?$/) {
            if($name =~ /\.$/ || $dig) {
                print STDERR "Ignoring '" . $zonerr->string . "', name must be part of zone.\n";
                next;
            }
            $name .= ".$origin.";
        }
        if($name !~ /\.$/) {
            $name .= ".";
        }
        if($ignoreNS && $type eq "NS" && $name =~ /^$origin\.$/) {
            print STDERR "Ignoring '" . $zonerr->string . "', --ignore-origin-ns enabled.\n";
            next;
        }

        $records->{$name} = $records->{$name} || {};

        my $recordList = $records->{$name}->{$type} = $records->{$name}->{$type} || [];

        foreach my $existingRecord (@$recordList) {
            if($existingRecord->{TTL} != $zonerr->ttl) {
                die "Can't process '".$zonerr->string.", its TTL value is "
                   ."different from other records of the same name and type.";
            }
        }

        my $record = {
            TTL =>   $zonerr->ttl,
            Value => $TYPES->{$type}->($zonerr),
        };

        $totalRdataLength += length($record->{Value});

        if($totalRdataLength > 32000) {
            die "The ResourceRecord data exceeds 32000 characters. Try"
             .  " separating into multiple batches.";
        }

        $recordCount++;

        if($recordCount > 1000) {
            die "ResourceRecords exceeds 1000. Try separating into"
              . " multiple batches.";
        }

        push(@$recordList, $record);
    } else {
        print STDERR "Ignoring '" . $zonerr->string . "', invalid type $type\n";
        next;
    }
}

# Print ChangeResourceRecordSetsRequest XML
print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
print "<ChangeResourceRecordSetsRequest xmlns=\"https://route53.amazonaws.com/doc/2010-10-01/\">\n";
print " <ChangeBatch>\n";
print "  <Comment>$comment</Comment>\n";
print "  <Changes>\n";

foreach my $name (keys %$records) {
    foreach my $type (keys %{$records->{$name}}) {
        my $ttl   = $records->{$name}->{$type}->[0]->{"TTL"};

        print "   <Change>\n";
        print "    <Action>$action</Action>\n";
        print "     <ResourceRecordSet>\n";
        print "      <Name>$name</Name>\n";
        print "      <Type>$type</Type>\n";
        print "      <TTL>$ttl</TTL>\n";
        print "      <ResourceRecords>\n";
         
        foreach my $rr (@{$records->{$name}->{$type}}) {
            my $value = $rr->{"Value"};
             
            print "       <ResourceRecord>\n";
            print "        <Value>$value</Value>\n";
            print "       </ResourceRecord>\n";
        }
         
        print "     </ResourceRecords>\n";
        print "    </ResourceRecordSet>\n";
        print "   </Change>\n";
    }
}

print "  </Changes>\n";
print " </ChangeBatch>\n";
print "</ChangeResourceRecordSetsRequest>\n";

