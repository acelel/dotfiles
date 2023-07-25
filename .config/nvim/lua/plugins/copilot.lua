-- vim.g.copilot_filetypes = { 'lua', 'python', 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' }
vim.g.copilot_no_tab_map = true

vim.cmd [[
  imap <silent><script><expr> <C-Space> copilot#Accept("")
]]
