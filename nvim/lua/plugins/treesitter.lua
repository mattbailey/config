require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    use_languagetree = true,
    -- disable = { "go" },
  },
  indent = {enable = true},
  autotag = {enable = true},
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  context_commentstring = {
    enable = true,
    config = {
      css = '// %s'
    }
  },
}
