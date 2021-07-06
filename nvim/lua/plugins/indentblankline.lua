local g = vim.g

g.indentLine_enabled = 1
g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_use_treesitter = true

-- and then use the highlight groups
g.indent_blankline_char_highlight_list = {"IndentOdd", "ToolbarLine"}
g.indent_blankline_space_char_highlight_list = {"IndentOdd", "ToolbarLine"}

-- don't show any characters
g.indent_blankline_char = " "
g.indent_blankline_space_char = " "

-- when using background, the trailing indent is not needed / looks wrong
g.indent_blankline_show_trailing_blankline_indent = false
