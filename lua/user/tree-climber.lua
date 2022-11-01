local status_ok, tree_climber = pcall(require, "tree-climber")
if not status_ok then
  return
end

local keyopts = { noremap = true, silent = true }
vim.keymap.set({ "n", "v", "o" }, "H", require("tree-climber").goto_parent, keyopts)
vim.keymap.set({ "n", "v", "o" }, "L", require("tree-climber").goto_child, keyopts)
vim.keymap.set({ "n", "v", "o" }, "J", tree_climber.goto_next, keyopts)
vim.keymap.set({ "n", "v", "o" }, "K", tree_climber.goto_prev, keyopts)
vim.keymap.set("n", "<c-k>", tree_climber.swap_prev, keyopts)
vim.keymap.set("n", "<c-j>", tree_climber.swap_next, keyopts)
