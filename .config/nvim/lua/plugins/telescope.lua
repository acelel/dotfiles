require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      }
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        width = { padding = 0 },
        height = { padding = 0 },
        preview_width = 0.5,
        st
      }
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
local api = vim.api;

require("telescope.pickers.layout_strategies").buffer_window = function(self)
  local layout = require("telescope.pickers.window").get_initial_window_options(self)
  local prompt = layout.prompt
  local results = layout.results
  local preview = layout.preview
  local config = self.layout_config
  local padding = self.window.border and 2 or 0
  local width = api.nvim_win_get_width(self.original_win_id)
  local height = api.nvim_win_get_height(self.original_win_id)
  local pos = api.nvim_win_get_position(self.original_win_id)
  local wline = pos[1] + 1
  local wcol = pos[2] + 1
  
  -- Height
  prompt.height = 1
  preview.height = self.previewer and math.floor(height * 0.4) or 0
  results.height = height
    - padding
    - (prompt.height + padding)
    - (self.previewer and (preview.height + padding) or 0)
  
  -- Line
  local rows = {}
  local mirror = config.mirror == true
  local top_prompt = config.prompt_position == "top"
  if mirror and top_prompt then
    rows = { prompt, results, preview }
  elseif mirror and not top_prompt then
    rows = { results, prompt, preview }
  elseif not mirror and top_prompt then
    rows = { preview, prompt, results }
  elseif not mirror and not top_prompt then
    rows = { preview, results, prompt }
  end
  local next_line = 1 + padding / 2
  for k, v in pairs(rows) do
    if v.height ~= 0 then
      v.line = next_line
      next_line = v.line + padding + v.height
    end
  end
  
  -- Width
  prompt.width = width - padding
  results.width = prompt.width
  preview.width = prompt.width
  
  -- Col
  prompt.col = wcol + padding / 2
  results.col = prompt.col
  preview.col = prompt.col
  
  if not self.previewer then
    layout.preview = nil
  end
  
  return layout
end
