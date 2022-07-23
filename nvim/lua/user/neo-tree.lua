vim.cmd[[let g:neo_tree_remove_legacy_commands = 1 ]] -- Remove legacy commands
vim.cmd[[
  hi NeoTreeGitModified   guibg=NONE guifg=#8ec07c
  hi NeoTreeGitUntracked  guibg=NONE guifg=#d3869b
  hi NeoTreeGitAdded      guibg=NONE guifg=#b8bb26
  hi NeoTreeExpander      guibg=NONE guifg=#458588
  hi NeoTreeDirectoryIcon guibg=NONE guifg=#458588
  hi NeoTreeDirectoryName guibg=NONE guifg=#458588
  hi NeoTreeDimText       guibg=NONE guifg=#7c6f64
  hi NeoTreeFileName      guibg=NONE guifg=#83a598
]]

vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",  {text = "", texthl  = "DiagnosticSignHint"})

require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false,
  sort_function = nil,
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size        = 2,
      padding            = 1, -- extra padding on left hand side
      -- indent guides
      with_markers       = true,
      indent_marker      = "│",
      last_indent_marker = "└",
      highlight          = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders     = true,
      expander_collapsed = "",
      expander_expanded  = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open   = "",
      folder_empty  = "",
      default       = "",
      highlight     = "NeoTreeFileIcon"
    },
    modified = {
      symbol    = "~",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      highlight      = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "",  -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "",  -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "﫧",-- this can only be used in the git_status source
        renamed   = "凜",-- this can only be used in the git_status source
        -- Status type
        untracked = "<~>",
        ignored   = "",
        unstaged  = "!",
        staged    = "+",
        conflict  = "?",
      }
    },
  },
  window = {
    position = "left",
    width    = 28,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<2-LeftMouse>"] = "open",
      ["<cr>"]          = "open",
      ["S"]             = "open_split",
      ["s"]             = "open_vsplit",
      ["t"]             = "open_tabnew",
      ["w"]             = "open_with_window_picker",
      ["C"]             = "close_node",
      ["z"]             = "close_all_nodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta"
      },
      never_show = { -- remains hidden even if visible is toggled to true
        --".DS_Store",
        --"thumbs.db"
      },
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
                                 -- time the current file is changed while the tree is open.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    window = {
      mappings = {
        ["<bs>"]  = "navigate_up",
        ["."]     = "set_root",
        ["H"]     = "toggle_hidden",
        ["/"]     = "fuzzy_finder",
        ["D"]     = "fuzzy_finder_directory",
        ["f"]     = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"]    = "prev_git_modified",
        ["]g"]    = "next_git_modified",
      }
    }
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
                                -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"]   = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."]    = "set_root",
      }
    },
  },
  git_status = {
    colors = false,
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  }
})
