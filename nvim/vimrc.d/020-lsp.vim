" NOTE: Requires neovim with LSP build in (nvim>=0.5.0)

function! LSPSetup()
lua << EOF
local on_attach_vim = function()
	require'completion'.on_attach()
	require'diagnostic'.on_attach()
	require'on_attach_status'
end
require'lspconfig'.gopls.setup{
	on_attach=on_attach_vim;
	settings = {
		gopls = {
			analyses = {
				fillreturns = true,
				undeclaredname = true,
				unusedparams = true,
				nonewvars = true,
			},
			completeUnimported = true,
			usePlaceholders = true
		}
	};
};
require'lspconfig'.bashls.setup{on_attach=on_attach_vim};
require'lspconfig'.clangd.setup{on_attach=on_attach_vim};
require'lspconfig'.cssls.setup{on_attach=on_attach_vim};
require'lspconfig'.dockerls.setup{on_attach=on_attach_vim};
require'lspconfig'.jsonls.setup{on_attach=on_attach_vim};
require'lspconfig'.pyls.setup{on_attach=on_attach_vim};
require'lspconfig'.rust_analyzer.setup{on_attach=on_attach_vim};
require'lspconfig'.sumneko_lua.setup{on_attach=on_attach_vim};
require'lspconfig'.terraformls.setup{on_attach=on_attach_vim};
require'lspconfig'.tsserver.setup{on_attach=on_attach_vim};
require'lspconfig'.yamlls.setup{
	on_attach=on_attach_vim;
	settings={
		yaml={
			customTags={
				"!And scalar",
				"!And mapping",
				"!And sequence",
				"!If scalar",
				"!If mapping",
				"!If sequence",
				"!Not scalar",
				"!Not mapping",
				"!Not sequence",
				"!Equals scalar",
				"!Equals mapping",
				"!Equals sequence",
				"!Or scalar",
				"!Or mapping",
				"!Or sequence",
				"!FindInMap scalar",
				"!FindInMap mappping",
				"!FindInMap sequence",
				"!Base64 scalar",
				"!Base64 mapping",
				"!Base64 sequence",
				"!Cidr scalar",
				"!Cidr mapping",
				"!Cidr sequence",
				"!Ref scalar",
				"!Ref mapping",
				"!Ref sequence",
				"!Sub scalar",
				"!Sub mapping",
				"!Sub sequence",
				"!GetAtt scalar",
				"!GetAtt mapping",
				"!GetAtt sequence",
				"!GetAZs scalar",
				"!GetAZs mapping",
				"!GetAZs sequence",
				"!ImportValue scalar",
				"!ImportValue mapping",
				"!ImportValue sequence",
				"!Select scalar",
				"!Select mapping",
				"!Select sequence",
				"!Split scalar",
				"!Split mapping",
				"!Split sequence",
				"!Join scalar",
				"!Join mapping",
				"!Join sequence",
			},
			format={
				enable=true;
			}
		};
	};
};
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
			\sh,
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
			\yaml,
			\ setlocal omnifunc=v:lua.vim.lsp.omnifunc

"autocmd BufWritePre,FileWritePre *.go :call LSPGoImportsReload()

autocmd FileType go nnoremap <silent> gI    <cmd>call LSPGoImportsReload()<CR>
autocmd BufEnter * lua require'completion'.on_attach()


nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gF    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

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

function! LSPGoImportsReload()
	" vim.lsp.buf.formatting()
lua << EOF
	client = vim.lsp.buf_get_clients(0)
	vim.lsp.stop_client(vim.lsp.buf_get_clients(0))
EOF
	sleep 1
	GoFmt
	edit
endfunction
