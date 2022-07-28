local lsp = vim.api.nvim_create_augroup("LSP", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = lsp,
    pattern = "lua",
    callback = function()
        local path = vim.fs.find({ ".luarc.json", ".luacheckrc", "stylua.toml", ".git" })
        vim.lsp.start({
            name = "lua-language-server",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.dirname(path[1]),
            settings = {
                Lua = {
                    completion = { enable = true, showWord = "Disable" },
                    runtime = { version = "LuaJIT" },
                    workspace = { library = { os.getenv("VIMRUNTIME") } },
                    telemetry = { enable = false },
                },
            },
        })
    end,
})
