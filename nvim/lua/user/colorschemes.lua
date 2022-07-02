local colorscheme  = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("ERROR: Colorscheme " .. colorscheme .. " not found.")
  return
end

vim.cmd[[
  hi SignColumn guibg=#28282    gui=none
  hi Visual     guifg=#ffffff2f guibg=#504945 gui=none
  hi Search     guifg=#504945   guibg=#fbf1c7

  set cursorline
  set cursorlineopt=number
  hi CursorLineNr cterm=bold term=bold gui=bold guibg=#282828 guifg=#d5c4a1
]]
