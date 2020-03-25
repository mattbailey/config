" NOTE: Requires neovim with LSP build in (nvim>=0.5.0)

function! LSPSetup()
lua << EOF
require'nvim_lsp'.gopls.setup{on_attach=require'completion'.on_attach};
require'nvim_lsp'.bashls.setup{};
require'nvim_lsp'.clangd.setup{};
require'nvim_lsp'.cssls.setup{};
require'nvim_lsp'.dockerls.setup{};
require'nvim_lsp'.jsonls.setup{};
require'nvim_lsp'.pyls.setup{};
require'nvim_lsp'.rust_analyzer.setup{};
require'nvim_lsp'.sumneko_lua.setup{};
require'nvim_lsp'.terraformls.setup{};
require'nvim_lsp'.tsserver.setup{};
EOF
endfunction

function! LSPUpdate()
  LspInstall gopls
  LspInstall bashls
  LspInstall clangd
  LspInstall cssls
  LspInstall dockerls
  LspInstall jsonls
  LspInstall pyls
  LspInstall rust_analyzer
  LspInstall sumneko_lua
  LspInstall terraformls
  LspInstall tsserver
endfunction

call LSPSetup()

autocmd Filetype \
      \go,
      \bash,
      \c,
      \cpp,
      \objcpp,
      \sh,
      \objc,
      \css,
      \scss,
      \less,
      \vim,
      \javascript,
      \javascriptreact,
      \javascript.jsx,
      \typescript,
      \typescriptreact,
      \typescript.tsx,
      \terraform,
      \lua,
      \rust,
      \python,
      \json,
      \rust,
      \dockerfile,
      \Dockerfile,
      \ setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gF    <cmd>lua vim.lsp.buf.formatting()<CR>

function! LSPHover()
lua << EOF
local util = require 'vim.lsp.util'
local params = util.make_position_params()
vim.lsp.buf.hover()
EOF
endfunction

function! LSPRename()
	let s:newName = input('Enter new name: ', expand('<cword>'))
	echom "s:newName = " . s:newName
	lua vim.lsp.buf.rename(s:newName)
endfunction
