-- vim.o.t_Co="256"
vim.o.termguicolors=true
-- vim.o.background="dark"

-- material config
-- Example config in lua
-- vim.g.material_style = 'deep ocean'
-- vim.g.material_style = "oceanic"
-- vim.g.material_style = "lighter"
-- vim.g.material_style = "darker"
-- vim.g.material_style = "palenight"
-- vim.g.material_italic_comments = true
-- vim.g.material_italic_keywords = true
-- vim.g.material_italic_functions = true
-- vim.g.material_italic_variables = false
-- vim.g.material_contrast = true
-- vim.g.material_contrast_windows = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.material_borders = false
-- vim.g.material_disable_background = false

-- -- nord config
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_cursorline_transparent = false

-- moonlight config
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = false
vim.g.moonlight_disable_background = false

-- Load the colorscheme
-- require('material').set()
-- require('nord').set()
-- require('moonlight').set()
vim.cmd 'colorscheme melange'

-- extras
vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
