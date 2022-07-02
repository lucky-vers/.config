local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then

  vim.notify("ERROR: Colorscheme " .. colorscheme .. " not found.")
  return

end

vim.cmd[[hi SignColumn guibg=#282828]]
vim.cmd[[hi Visual guifg=#ffffff2f guibg=#504945 gui=none]]
