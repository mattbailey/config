-- from https://github.com/wbthomason/lsp-status.nvim

local lsp_status = require('lsp-status')
-- completion_customize_lsp_label as used in completion-nvim
lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress callback
lsp_status.register_progress()

function on_attach_status()
  -- Register the client for messages
  lsp_status.register_client(client.name)

  -- Set up autocommands for refreshing the statusline when LSP information changes
  vim.api.nvim_command('augroup lsp_aucmds')
  vim.api.nvim_command('au! * <buffer>')
  vim.api.nvim_command('au User LspDiagnosticsChanged redrawstatus!')
  vim.api.nvim_command('au User LspMessageUpdate redrawstatus!')
  vim.api.nvim_command('au User LspStatusUpdate redrawstatus!')
  vim.api.nvim_command('augroup END')

  -- If the client is a documentSymbolProvider, set up an autocommand
  -- to update the containing function
  if client.resolved_capabilities.document_symbol then
    vim.api.nvim_command('augroup lsp_aucmds')
    vim.api.nvim_command(
    'au CursorHold <buffer> lua require("lsp-status").update_current_function()'
    )
    vim.api.nvim_command('augroup END')
  end
end


