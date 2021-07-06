local lspconfig = require 'lspconfig'
local configs = require("lspconfig/configs") -- Make sure this is a slash (as theres some metamagic happening behind the scenes)

-- Golang
lspconfig.gopls.setup{
  on_attach = require'plugins.lsp.common'.on_attach,
  settings = {
    gopls = {
      analyses = {
        fillreturns = true,
        undeclaredname = true,
        unusedparams = true,
        nonewvars = true,
        unreachable = false
      },
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true,
        tidy = true,
        vendor = true,
        upgrade_dependency = true
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "fuzzy",
      symbolMatcher = "fuzzy",
      gofumpt = true,
      buildFlags = {"-tags", "integration"},
      directoryFilters = {"-node_modules"},
      experimentalPackageCacheKey = true,
      experimentalWorkspaceModule = true,
      hoverKind = "Structured"
    }
  }
}

-- goimports formatting
function Goimports(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end
vim.api.nvim_command("autocmd BufWritePre *.go lua Goimports(1000)")

-- Lua
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = require'plugins.lsp.common'.on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'use'
        }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        },
        maxPreload = 10000
      }
    }
  }
}

-- YAML
lspconfig.yamlls.setup{
  on_attach = require'plugins.lsp.common'.on_attach,
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

-- JSON
lspconfig.jsonls.setup{
  on_attach = require'plugins.lsp.common'.on_attach,
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        }, {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        }, {
          fileMatch = {
            ".prettierrc", ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        }, {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
        }, {
          fileMatch = {
            ".babelrc", ".babelrc.json", "babel.config.json"
          },
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = {"lerna.json"},
          url = "https://json.schemastore.org/lerna.json"
        }, {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        }, {
          fileMatch = {
            ".stylelintrc", ".stylelintrc.json",
            "stylelint.config.json"
          },
          url = "http://json.schemastore.org/stylelintrc.json"
        }
      }
    }
  }
}


-- Other langs
lspconfig.bashls.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.clangd.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.cssls.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.dockerls.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.jsonls.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.pyls.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.rust_analyzer.setup{on_attach=require'plugins.lsp.common'.on_attach};
lspconfig.terraformls.setup{on_attach=require'plugins.lsp.common'.on_attach};

--[[ local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}
local luafmt = {
  formatCommand = "lua-format -i",
  formatStdin = true
}
local rustfmt = {
  formatCommand = "rustfmt",
  formatStdin = true
}
local autopep = {
  formatCommand = "autopep8 -",
  formatStdin = true
}
local goimports = {
  formatCommand = "goimports -",
  formatStdin = true,
}

local languages = {
    lua = {luafmt},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    javascriptreact = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    html = {prettier},
    scss = {prettier},
    css = {prettier},
    markdown = {prettier},
    rust = {rustfmt},
    python = {autopep},
    go = {goimports},
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern(".git"),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    -- client.resolved_capabilities.goto_definition = false
  end,
  filetypes = vim.tbl_keys(languages),
  init_options = {documentFormatting = true, codeAction = true},
  settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
} ]]

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {
        texthl = "LspDiagnosticsSignError",
        text = "",
        numhl = "LspDiagnosticsSignError"
    }
)

vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {
        texthl = "LspDiagnosticsSignWarning",
        text = "",
        numhl = "LspDiagnosticsSignWarning"
    }
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {
        texthl = "LspDiagnosticsSignHint",
        text = "",
        numhl = "LspDiagnosticsSignHint"
    }
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {
        texthl = "LspDiagnosticsSignInformation",
        text = "",
        numhl = "LspDiagnosticsSignInformation"
    }
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    " ﬌  (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
