local term_opts = { silent = true }
local opts      = { silent = true, noremap = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map("", "<SPACE>", "<Nop>", opts)

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Mode indicators
  -- Normal Mode       = n
  -- Insert Mode       = i
  -- Visual Mode       = v
  -- Visual Block Mode = x
  -- Terminal Mode     = t
  -- Command Mode      = c

-- NORMAL --

  -- Indent with one key
  map("n", "<", "<<", opts) -- Indent left
  map("n", ">", ">>", opts) -- Indent right

  -- Create splits
  map("n", "<A-h>", "<C-w>s", opts) -- Horizontal split
  map("n", "<A-v>", "<C-w>v", opts) -- Vertical split

  -- Better window navigation
  map("n", "<C-k>", "<C-w>k", opts) -- Move up
  map("n", "<C-j>", "<C-w>j", opts) -- Move down
  map("n", "<C-h>", "<C-w>h", opts) -- Move left
  map("n", "<C-l>", "<C-w>l", opts) -- Move right

  -- Resize with arrows
  map("n", "<C-Up>",    ":resize +1<CR>",          opts) -- Vertically resize up by 1
  map("n", "<C-Down>",  ":resize -1<CR>",          opts) -- Vertically resize down by 1
  map("n", "<C-Left>",  ":vertical resize -1<CR>", opts) -- Vertically resize left by 1
  map("n", "<C-Right>", ":vertical resize +1<CR>", opts) -- Vertically resize right by 1

  -- Navigate buffers
  map("n", "<S-l>", ":bnext<CR>",     opts) -- Go to next buffer
  map("n", "<S-h>", ":bprevious<CR>", opts) -- Go to previous buffer

  -- Enter visual block mode
  map("n", "<leader>v", "<C-v>", opts)

  -- Save the file
  map("n",  "s",        ":w<CR>",  opts) -- Save
  map("n",  "S",        "ZZ",      opts) -- Save & Quit
  map("n", "<leader>x", ":q!<CR>", opts) -- Quit without saving

  -- Go to line extremes
  map("n", "<A-i>", "0", opts) -- Go to begining
  map("n", "<A-a>", "$", opts) -- Go to end

  -- Select all text
  map("n", "<C-a>", "gg0vG$", opts)

  -- Search and Replace
  map("n", "<leader>r", ":%s/", opts)

  -- Increment numbers
  map("n", "=", "<C-a>", opts) -- Increase value
  map("n", "-", "<C-x>", opts) -- Decrease value

  -- Move to middle while scrolling to bottom
  map("n", "G", "Gzz", opts)

  -- Add a space
  map("n", ",", "i<SPACE><ESC>", opts)

  -- Move text up and down
  map("n", "<A-j>", ":m .+1<CR>", opts)
  map("n", "<A-k>", ":m .-2<CR>", opts)

  -- Start plugin EasyAlign
  map("n", "ga", "<Plug>(EasyAlign)", opts)

  -- Disable search highlighting termporarily
  map("n", "<ESC>", ":noh<CR>", opts)

  -- Toggle line truncation
  map("n", "<leader>t", ":set wrap!<CR>", opts)

  -- GitGutter
  map("n", "(", ":GitGutterPrevHunk<CR>", opts) -- Move to previous hunk
  map("n", ")", ":GitGutterNextHunk<CR>", opts) -- Move to next hunk

-- INSERT --

  -- Press jj to enter visual mode
  map("i", "jj", "<ESC>", opts)

  -- Autocomplete brackets and quotes
  map("i", "\"", "\"\"<ESC>i", opts) -- Double quotes
  map("i", "'", "\'\'<ESC>i", opts) -- Single quotes
  map("i", "(", "()<ESC>i",    opts) -- Circle brackets
  map("i", "[", "[]<ESC>i",    opts) -- Square brackets
  map("i", "{", "{}<ESC>i",    opts) -- Curly brackets

  -- Telescope
  map("n", "<leader>f", ":Telescope find_files<CR>", opts)
  map("n", "<c-t>",     ":Telescope live_grep<CR>",  opts)

-- VISUAL --

  -- Stay in indent mode
  map("v", "<", "<gv", opts) -- Indent left
  map("v", ">", ">gv", opts) -- Indent right

  -- Add brackets and quotes to selection
  map("v", "<leader>\"", "<ESC>`>a\"<ESC>`<i\"<ESC>", opts)
  map("v", "<leader>'",  "<ESC>`>a\'<ESC>`<i\'<ESC>", opts)
  map("v", "<leader>{",  "<ESC>`>a}<ESC>`<i{<ESC>",   opts)
  map("v", "<leader>(",  "<ESC>`>a)<ESC>`<i(<ESC>",   opts)
  map("v", "<leader>[",  "<ESC>`>a]<ESC>`<i[<ESC>",   opts)

  -- Move text up and down
  map("v", "<A-j>", ":m .+1<CR>==", opts)
  map("v", "<A-k>", ":m .-2<CR>==", opts)

  -- Go to line extremes
  map("v", "<A-i>", "0", opts) -- Go to begining
  map("v", "<A-a>", "$", opts) -- Go to end

-- VISUAL BLOCK --

  -- Move text
  map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

  -- Start plugin EasyAlign
  map("x", "ga", "<Plug>(EasyAlign)", opts)

  -- Add spaces
  map("x", ",", "I<SPACE><ESC>gv", opts)

-- TERMINAL --

  -- Better terminal navigation
  map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
