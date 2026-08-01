require("blink.cmp").setup({
  keymap = { preset = "enter" },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
  completion = {
    documentation = { auto_show = true },
  },
})
