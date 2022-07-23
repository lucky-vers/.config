local colorscheme  = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("ERROR: Colorscheme " .. colorscheme .. " not found.")
  return
end

vim.cmd[[
  hi Visual     guifg=NONE      guibg=#495551 gui=NONE
  hi Search     guifg=#4d5f47   guibg=#8ec07c
  hi SignColumn                 guibg=#282828 gui=NONE

  set cursorline
  set cursorlineopt=number
  hi CursorLineNr cterm=bold term=bold gui=bold guibg=#282828 guifg=#d5c4a1
]]
