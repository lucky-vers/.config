local lua_options = {
  mouse         = "a",     -- Allow mouse control
  expandtab     = true,    -- Change tabs to spaces
  shiftwidth    = 2,       -- Change the indentation width to 2
  tabstop       = 2,       -- Change the tab width to 2
  number        = true,    -- Show line numbers
  numberwidth   = 2,       -- Set width of line numbers to 2
  fileencoding  = "utf-8", -- Set the file encoding format
  hlsearch      = true,    -- Highlight search matches
  scrolloff     = 6,       -- Start scrolling vertically at 6 pixels from the end
  sidescrolloff = 6,       -- Start scrolling horizontally at 6 pixels from the end
  backup        = false,   -- Don't backup files
  smartindent   = true,    -- Enable smart indent
  termguicolors = true,    -- Allow terminals to use more colors
  signcolumn    = "yes",   -- Add a column on the left
  ignorecase    = true,    -- Disable case sensitivity
  smartcase     = true,    -- Enable smartcase
  showmode      = false,   -- Disable showmode
}

for key, value in pairs(lua_options) do
  vim.opt[key] = value
end

-- Automatically remove whitespace during filesave
vim.cmd[[autocmd BufWritePre * %s/\s\+$//e]]

-- Set cmp menu transparency
vim.cmd[[
  set pumblend=18
  hi PmenuSel blend=0 guibg=#8ec07c guifg=#282828
]]

-- Show tabs, trailing whitespace and spaces
vim.cmd[[
  set listchars+=space:·,trail:×,tab:<>
  set list
]]
