local api = vim.api

local function augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command('augroup '..group_name)
		api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			api.nvim_command(command)
		end
		api.nvim_command('augroup END')
	end
end

augroups({
  _global = {
    {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
    {'BufWritePre', '*.go', 'lua vim.lsp.buf.formatting_sync()'},
    {'BufNewFile,BufRead', '*.proto', 'setf proto'},
    {'BufNewFile,BufRead', '*.proto', 'syntax on'},
    {'BufNewFile,BufRead', '*.mk', 'setf make'},
    {'BufNewFile,BufRead', '*.mk', 'syntax on'},
    {'BufNewFile,BufRead', 'Makefile', 'setf make'},
    {'BufNewFile,BufRead', 'Makefile', 'syntax on'},
  },
  _dashboard = {
    {
      'FileType', 'dashboard',
      'setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= '
    },
    {
      'FileType', 'dashboard',
      'set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2'
    }
  },
})

-- hide line numbers in terminal windows

vim.api.nvim_exec([[
au BufEnter term://* setlocal nonumber
]], false)
