require("which-key")
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
      s = { "<cmd>split<cr>", "Split"},
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
require("which-key").register(leader_mappings, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
})
