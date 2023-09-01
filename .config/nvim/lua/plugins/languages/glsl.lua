require('glslView').setup {
    exe_path = '/usr/bin/glslViewer',
      arguments = { '-l', '-w', '800', '-h', '600' },
    }

vim.cmd[[
  au VimEnter *.frag GlslView
  au BufWritePost *.frag !glslangValidator %
]]
