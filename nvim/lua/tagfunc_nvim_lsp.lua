local lsp = require 'vim.lsp'
local util = require 'vim.lsp.util'
local log = require 'vim.lsp.log'
local vim = vim

-- Ref (in Japanese): https://daisuzu.hatenablog.com/entry/2019/12/06/005543
function tagfunc_nvim_lsp(pattern, flags, info)
 local result = {}
 local isSearchingFromNormalMode = flags == "c"

 local method
 local params
 if isSearchingFromNormalMode then
   -- Jump to the definition of the symbol under the cursor
   -- when called by CTRL-]
   method = 'textDocument/definition'
   params = util.make_position_params()
 else
   -- NOTE: Currently I'm not sure how this clause is tested
   --       because `:tag` command doesn't seem to use `tagfunc`.

   -- Search with `pattern` when called by ex command (e.g. `:tag`)
   method = 'workspace/symbol'

   -- Delete "\<" from `pattern` when prepended.
   -- Perhaps the server doesn't support regex in vim!
   params = {}
   if string.find(flags, 'i') then
     params.query = string.sub(pattern, '^\\<', '')
   else
     params.query = pattern
   end
 end
 local client_id_to_results, err = lsp.buf_request_sync(0, method, params)
 if err then
   print('Error when calling tagfunc: ' .. err)
   return result
 end

 for _client_id, results in pairs(client_id_to_results) do
   for i, lsp_result in ipairs(results.result) do
     local name
     local location
     if isSearchingFromNormalMode then
       name = pattern
       location = lsp_result
     else
       name = lsp_result.name
       location = lsp_result.location
     end
     local location_for_tagfunc = {
       name = name,
       filename = vim.uri_to_fname(location.uri),
       cmd = tostring(location.range.start.line + 1)
     }
     table.insert(result, location_for_tagfunc)
   end
 end
 return result
end
