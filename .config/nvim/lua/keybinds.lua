local wk = require("which-key")
local leader_mappings_noremap = {
    --file
    ["<leader>"] = {"<cmd>HopWord<cr>", "Hop to word"},
    f = {
      name = "+File",
      s = { "<cmd>w<cr>", "Save file"},
      S = { "<cmd>w!<cr>", "Save file!"},
      ["space"] = { "<cmd> lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", "Quick Switch" },
      q = { "<cmd> lua require(\"harpoon.mark\").add_file()<cr>", "Add to Quick Switch" },
    },
    F = {
      name = "+Find",
      f = { "<cmd>Telescope find_files<cr>", "Files"},
      t = { "<cmd>Telescope live_grep<cr>", "Text"},
      -- f = { "<cmd>Files<cr>", "Files"},
      -- t = { "<cmd>Rg<cr>", "Text"},
    },
    --window
    w = {
      name = "+Window",
      c = { "<c-w>q", "Close split"},
      C = { "<cmd>BufferClose!<cr><c-w>q", "Close split and buffer"},
      s = { "<cmd>split<cr>", "Split"},
      t = { "<cmd>split<cr>7<c-w>_<cmd>term<cr>", "Terminal"},
      S = { "<cmd>vsplit<cr>", "Split vertical"},
   },
    b = {
      name = "+Buffer",
      a = { "<cmd>BufferCloseAllButPinned<cr>", "Close all but pinned"},
      A = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current"},
      c = { "<cmd>BufferClose<cr>", "Close buffer"},
      C = { "<cmd>BufferClose!<cr>", "Close buffer!"},
      p = { "<cmd>BufferPin<cr>", "Toggle pinned"},
    },
  }

wk.register(leader_mappings_noremap, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
})

local leader_mappings = {
    g = {
      name = "+GoTo",
      d = { "<Plug>(coc-definition)", "Definition"},
      t = { "<Plug>(coc-type-definition)", "Type Definition"},
      i = { "<Plug>(coc-implementation)", "Implementation"},
      r = { "<Plug>(coc-references)", "References"},
    },
  }

wk.register(leader_mappings, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  silent = false, -- use `silent` when creating keymaps
})

-- funky bindings
local keyset = vim.api.nvim_set_keymap

-- window navigation
keyset('n', '<c-up>', '<c-W><c-K>', { noremap = true, silent = true })
keyset('n', '<c-down>', '<c-W><c-J>', { noremap = true, silent = true })
keyset('n', '<c-left>', '<c-W><c-H>', { noremap = true, silent = true })
keyset('n', '<c-right>', '<c-W><c-L>', { noremap = true, silent = true })

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset('i', '<c-s>', 'copilot#Accept("<cr>")', opts) -- copilot autocomplete
keyset('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm(): "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', opts) -- coc-autocomplete
keyset('n', '<F1>', '<Plug>(coc-diagnostic-next)', { silent = true }) -- go to next error
keyset('n', '<c-F1>', '<Plug>(coc-diagnostic-prev)', { silent = true }) -- go to previous error
keyset('n', '<F2>', '<Plug>(coc-rename)', { silent = true }) -- rename
keyset('n', '<F4>', ':FloatermToggle<cr>', { silent = true }) -- toggle terminal

keyset('n', '<c-x>', ':NvimTreeToggle<cr>', { silent = true }) -- toggle nvimtree
keyset('n', 'gb', '<C-o>', { silent = true }) -- go back
keyset('v', '<c-c>', '"+y', { silent = true }) -- copy to clipboard
keyset('n', '<c-_>', ':CommentToggle<cr>', { silent = true }) -- toggle comment
keyset('n', '<c-/>', ':CommentToggle<cr>', { silent = true }) -- toggle comment
keyset('v', '<c-_>', ':CommentToggle<cr>gv', { silent = true }) -- toggle comment (visual)
keyset('v', '<c-/>', ':CommentToggle<cr>gv', { silent = true }) -- toggle comment (visual)
keyset('n', 'p', 'p`]', { silent = true }) -- auto format on paste
keyset('n', '<c-f>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true }) -- harpoon
