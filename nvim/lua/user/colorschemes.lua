local colorscheme  = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("ERROR: Colorscheme " .. colorscheme .. " not found.")
  return
end

vim.cmd[[
  hi SignColumn guibg=#282828
  hi Visual     guifg=#ffffff2f guibg=#504945 gui=none
  hi Search     guifg=#504945   guibg=#fbf1c7
]]
