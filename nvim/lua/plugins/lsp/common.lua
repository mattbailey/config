local lsp_config = {}

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

function lsp_config.on_attach(client, bufnr)
    documentHighlight(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    require'lsp_signature'.on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "single"
        }
    })
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

function lsp_config.install()
	require('lspinstall').install_server('bash')
	require('lspinstall').install_server('cpp')
	require('lspinstall').install_server('cmake')
	require('lspinstall').install_server('css')
	require('lspinstall').install_server('dockerfile')
	require('lspinstall').install_server('elixir')
	require('lspinstall').install_server('go')
	require('lspinstall').install_server('graphql')
	require('lspinstall').install_server('html')
	require('lspinstall').install_server('json')
	require('lspinstall').install_server('latex')
	require('lspinstall').install_server('lua')
	require('lspinstall').install_server('php')
	require('lspinstall').install_server('python')
	require('lspinstall').install_server('ruby')
	require('lspinstall').install_server('rust')
	require('lspinstall').install_server('tailwindcss')
	require('lspinstall').install_server('terraform')
	require('lspinstall').install_server('typescript')
	require('lspinstall').install_server('vim')
	require('lspinstall').install_server('vue')
	require('lspinstall').install_server('yaml')
end

return lsp_config
