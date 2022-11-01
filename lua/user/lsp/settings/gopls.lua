return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      hints = {
        compositeLiteralTypes = true,
      },
    },
  },
}
