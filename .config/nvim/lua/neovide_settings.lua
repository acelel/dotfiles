
if vim.g.neovide then
  vim.opt.guifont = { "Iosevka Term", "h14" }
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_profiler = false 

  -- goofy ahh
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_cursor_vfx_opacity = 50.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.3
end
