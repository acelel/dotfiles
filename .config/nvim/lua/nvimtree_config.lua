local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- following options are the default
vim.api.nvim_command('highlight NvimTreeFolderName guifg=white')
vim.api.nvim_command('highlight NvimTreeOpenedFolderName guifg=#ff6077 gui=italic')
require'nvim-tree'.setup {
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
} -- END_DEFAULT_OPTS
