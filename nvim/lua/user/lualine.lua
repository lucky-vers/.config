require('lualine').setup({
  options = {
    icons_enabled        = true,
    theme                = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators   = { left = '', right = '' },
    disabled_filetypes   = {},
    always_divide_middle = true,
    globalstatus         = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
    lualine_c = { 'filesize', { 'filename', symbols = { modified = ' ', readonly = ' ', unnamed = '[NO NAME]' }, path = 3 } },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { { 'filetype', colored = false } },
    lualine_z = { 'progress', 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', symbols = { modified = ' ', readonly = ' ', unnamed = '[NO NAME]', path = 3 } } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'neo-tree', 'toggleterm' }
})
