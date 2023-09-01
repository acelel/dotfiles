require('treesitter').setup()
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "html", "json", "css", "regex", "toml" },
  sync_install = false,
  auto_install = true,
  ignore_install = { },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ident = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}
