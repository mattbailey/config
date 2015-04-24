#!/usr/bin/env bash

tun_ip=$(ifconfig utun0 | grep inet | awk '{print $2}')

sudo route add -net $1 $tun_ip
