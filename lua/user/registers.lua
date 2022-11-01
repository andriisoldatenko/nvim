local status_ok, registers = pcall(require, "registers")
if not status_ok then
  return
end

registers.setup({
  show = '*+"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:',
  hide_only_whitespace = true,
  show_empty = true,
  trim_whitespace = true,
  window = {
    border = "rounded",
  },
})
