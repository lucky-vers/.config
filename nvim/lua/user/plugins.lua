local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- General
  use "wbthomason/packer.nvim"           -- Have packer manage itself
  use "nvim-lua/popup.nvim"              -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"            -- Useful lua functions used ny lots of plugins
  use "vim-airline/vim-airline"          -- A simple status bar
  use "vim-airline/vim-airline-themes"   -- Themes for the status bar
  use "psliwka/vim-smoothie"             -- Vim smooth scrolling
  use "nvim-telescope/telescope.nvim"    -- Telescope
  use "junegunn/vim-easy-align"          -- Align objects easily

  -- Color Schemes
  use "morhetz/gruvbox"                  -- Gruvbox
  use "catppuccin/nvim"                  -- Catpuccin
  use "altercation/vim-colors-solarized" -- Solarized
  use "LunarVim/Colorschemes"            -- LunarVim color schemes
  use "folke/tokyonight.nvim"            -- Tokyo Night
  use "dracula/vim"                      -- Dracula
  use "flazz/vim-colorschemes"           -- A package of multiple color schemes

  -- CMP
  use "hrsh7th/nvim-cmp"                 -- Completion plugin
  use "hrsh7th/cmp-buffer"               -- Buffer Completions
  use "hrsh7th/cmp-path"                 -- Path Completions
  use "hrsh7th/cmp-cmdline"              -- Cmdline Completions
  use "hrsh7th/cmp-nvim-lsp"             -- LSP Completion
  use "saadparwaiz1/cmp_luasnip"         -- Snippet Completions

  -- Snippets
  use "L3MON4D3/LuaSnip"                 -- Snippet Engine
  use "rafamadriz/friendly-snippets"     -- A Bunch of Snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"            -- LSP Enabler
  use "williamboman/nvim-lsp-installer"  -- LSP Installer

  -- Treesitter
  use {                                  -- Main Treesitter package
  "nvim-treesitter/nvim-treesitter",     -- --
  run = ":TSUpdate"                      -- --
  }                                      -- --
  use "p00f/nvim-ts-rainbow"             -- Rainbow parentheses

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
