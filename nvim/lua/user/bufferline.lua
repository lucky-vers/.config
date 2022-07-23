local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

require("bufferline").setup({
  options = {
    numbers                      = "none",
    close_command                = "Bdelete! %d",
    right_mouse_command          = "Bdelete! %d",
    left_mouse_command           = "buffer %d",
    middle_mouse_command         = nil,
    indicator_icon               = "",
    buffer_close_icon            = "",
    modified_icon                = "!",
    close_icon                   = "",
    left_trunc_marker            = "<~",
    right_trunc_marker           = "~>",
    max_name_length              = 24,
    max_prefix_length            = 30, -- prefix used when a buffer is de-duplicated
    tab_size                     = 25,
    diagnostics                  = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    show_buffer_icons            = false,
    show_buffer_close_icons      = true,
    show_close_icon              = true,
    show_tab_indicators          = true,
    persist_buffer_sort          = true,
    enforce_regular_tabs         = true,
    always_show_bufferline       = true,
    separator_style              = "thin",
    offsets                      = { { filetype = "neo-tree", text = "", padding = 0 } },
  },
  highlights = {

    fill = {
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = 'NONE',
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    buffer_selected = {
      guifg = {attribute='fg',highlight='#0000ff'},
      guibg = '#504945',
      gui   = 'none'
    },
    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = '#3c3836',
    },

    close_button_selected = {
      guifg = '#ebdbb2',
      guibg = '#504945',
    },
    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "TabLineSel" },
      gui   = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui   = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui   = "italic",
    },

    modified = {
      guifg = '#d65d0e',
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      guifg = '#fe8019',
      guibg = '#504945',
    },
    modified_visible = {
      guifg = '#d65d0e',
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      guifg = '#3c3836',
      guibg = '#3c3836',
    },
    separator_selected = {
      guifg = '#504945',
      guibg = '#504945',
    },
    separator_visible = {
      guifg = '#504945',
      guibg = '#504945',
    },

    indicator_selected = {
      guifg = '#8ec07c',
      guibg = '#504945',
    },
  },
})
