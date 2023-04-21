local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

--[[ local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ capabilities.textDocument.foldingRange = { ]]
--[[   dynamicRegistration = false, ]]
--[[   lineFoldingOnly = true, ]]
--[[ } ]]
--[[ local language_servers = {"gopls"} -- like {'gopls', 'clangd'} ]]
--[[ for _, ls in ipairs(language_servers) do ]]
--[[   require("lspconfig")[ls].setup({ ]]
--[[     capabilities = capabilities, ]]
--[[     other_fields = ..., ]]
--[[   }) ]]
--[[ end ]]


-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

