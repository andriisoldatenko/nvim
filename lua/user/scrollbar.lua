local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  return
end

scrollbar.setup({
  handlers = {
    diagnostic = true,
    search = true, -- Requires hlslens to be loaded
    gitsigns = true, -- Requires gitsigns.nvim
  },
})

require("gitsigns").setup()

require("hlslens").setup({
  build_position_cb = function(plist, _, _, _)
    require("scrollbar.handlers.search").handler.show(plist.start_pos)
  end,
})

vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
    ]])
