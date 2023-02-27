require("which-key")
local wk = require("which-key")
local leader_mappings = {
    --file
    ["<leader>"] = {"<cmd>HopWord<cr>", "Hop to word"},
    f = {
      name = "File",
      s = { "<cmd>w<cr>", "Save file"},
      S = { "<cmd>w!<cr>", "Save file!"},
    },
    F = {
      name = "Find",
      f = { "<cmd>Telescope find_files<cr>", "Files"},
      t = { "<cmd>Telescope live_grep<cr>", "Text"},
      -- f = { "<cmd>Files<cr>", "Files"},
      -- t = { "<cmd>Rg<cr>", "Text"},
    },
    g = {
      name = "GoTo",
      d = { "<Plug>coc-definition<cr>", "Definition"},
      t = { "<Plug>coc-type-definition<cr>", "Type Definition"},
      i = { "<Plug>coc-implementation<cr>", "Implementation"},
      r = { "<Plug>coc-references<cr>", "References"},
    },
    --window
    w = {
      name = "Window",
      c = { "<c-w>q", "Close split"},
      C = { "<cmd>BufferClose!<cr><c-w>q", "Close split and buffer"},
      s = { "<cmd>split<cr>", "Split"},
      t = { "<cmd>split<cr>7<c-w>_<cmd>term<cr>", "Terminal"},
      S = { "<cmd>vsplit<cr>", "Split vertical"},
   },
    b = {
      name = "Buffer",
      a = { "<cmd>BufferCloseAllButPinned<cr>", "Close all but pinned"},
      A = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current"},
      c = { "<cmd>BufferClose<cr>", "Close buffer"},
      C = { "<cmd>BufferClose!<cr>", "Close buffer!"},
      p = { "<cmd>BufferPin<cr>", "Toggle pinned"},
    },
  }
wk.register(leader_mappings, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
})

local imode_mappings = {
  
}
wk.register(imode_mappings, {
  mode = "i",
  silent = true,
  noremap = true
})
