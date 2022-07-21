-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup = {
  renderer = {
    icons = {
      webdev_colors = false
      show = {
        default = "",
        symlink = "",
        git = {
          unstaged   = " !",
          staged     = " +",
          unmerged   = " ",
          renamed    = "凜",
          deleted    = "﫧",
          untracked  = " ~",
          ignored    = " ◌",
        },
        folder = {
          default    = "",
          open       = "",
          empty      = "",
          empty_open = "",
          symlink    = "",
          },
         },
       },
     },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
}
