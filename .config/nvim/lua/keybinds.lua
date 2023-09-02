local wk = require("which-key")
-- funky bindings
local keyset = vim.api.nvim_set_keymap

-- window navigation
keyset('n', '<c-up>', '<c-W><c-K>', { noremap = true, silent = true })
keyset('n', '<c-down>', '<c-W><c-J>', { noremap = true, silent = true })
keyset('n', '<c-left>', '<c-W><c-H>', { noremap = true, silent = true })
keyset('n', '<c-right>', '<c-W><c-L>', { noremap = true, silent = true })

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset('i', '<c-s>', 'copilot#Accept("<cr>")', opts) -- copilot autocomplete
keyset('n', '<F1>', ':ToggleTerm<cr>', { silent = true }) -- toggle terminal

keyset('n', '<c-f>', ':Telescope buffers hidden=true ignore=true border=false<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-x>', ':Telescope find_files hidden=true ignore=true border=false<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-t>', ':Telescope live_grep hidden=true ignore=true border=false<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-h>', ':Telescope which-key hidden=true ignore=true border=false<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-u>', ':UndotreeToggle<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-s>', ':w<cr>', { silent = true }) -- toggle nvimtree
keyset('n', '<c-q>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true }) -- harpoon
keyset('n', 'gb', '<C-o>', { silent = true }) -- go back
keyset('v', '<c-c>', '"+y', { silent = true }) -- copy to clipboard
keyset('n', '<c-_>', ':CommentToggle<cr>', { silent = true }) -- toggle comment
keyset('n', '<c-/>', ':CommentToggle<cr>', { silent = true }) -- toggle comment
keyset('v', '<c-_>', ':CommentToggle<cr>gv', { silent = true }) -- toggle comment (visual)
keyset('v', '<c-/>', ':CommentToggle<cr>gv', { silent = true }) -- toggle comment (visual)
keyset('n', 'p', 'p`]', { silent = true }) -- auto format on paste

local lsp_mappings = {
  g = {
    name = "+GoTo",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementations" },
    o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "type definition" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help" },
  },
  d = {
    name = "+Diagnostics",
    o = { "<cmd>lua vim.diagnostic.open_float()<cr>", "open diagnostics" },

  },
}
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs, desc)
      local opts = {buffer = true, desc = desc}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'rename')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'code action')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', 'code action')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'previous diagnostic')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'next diagnostic')
    bufmap('n', '<c-space>', '<cmd>lua vim.diagnostic.actions()<cr>', 'next diagnostic')

    wk.register(lsp_mappings, {
      mode = "n", -- NORMAL mode
      prefix = "",
      silent = false, -- use `silent` when creating keymaps
    })
  end
})

-- which-key mappings
local leader_mappings_noremap = {
    --file
    ["<leader>"] = {"<cmd>HopWord<cr>", "Hop to word"},
    f = {
      name = "+File",
      f = { "<cmd>NvimTreeFindFile<cr>", "Focus"},
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
    g = {
      name = "+Git",
      s = { "<cmd>Git<cr>", "status"},
      d = { "<cmd>Gdiffsplit<cr>", "diff"},
      c = { "<cmd>Git commit<cr>", "commit"},
      a = { "<cmd>Git add .<cr>", "add"},
      A = { "<cmd>Git add -A<cr>", "add all"},
      b = { "<cmd>Git blame<cr>", "blame"},
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


