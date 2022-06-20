local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {"python", "cpp", "java", "c", "lua"},
  sync_install = false,
	ignore_install = { "" },      		  				-- List of parsers to ignore installing
	highlight = {
		enable = true,														-- "false" will disable the whole extension
		disable = { "" },													-- List of languages that will be disabled
    additional_vim_regex_highlighting = true,

  },
	indent = { enable = true, disable = { "yaml" } },
	autopairs = {
		enable = true,
	},
	rainbow = {
  enable = true,
  -- disable = { "jsx", "cpp" }, List of languages you want to disable the plugin for
  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- Do not enable for files with more than n lines, int
  colors = {"#fb4934",  -- Table of hex strings
						"#fe8019",
						"#fabd2f",
						"#b8bb26",
						"#8ec07c",
						"#83a598",
						"#d3869b"},
  -- termcolors = {} -- table of colour name strings
  }
}
