local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = {},
  sync_install     = false,
  ignore_install   = { "" },
  highlight        = {
    enable         = true,
    disable        = { "" },
  },
  indent           = { enable = true, disable = { "yaml" } },
  autopairs        = { enable = false },
  rainbow = {
  enable           = true,
  extended_mode    = true,
  max_file_lines   = nil,
  colors           = {"#fb4934", "#fe8019", "#fabd2f", "#b8bb26", "#8ec07c", "#83a598", "#d3869b" },
  },
}
