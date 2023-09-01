vim.cmd [[packadd packer.nvim]]
function get_config(name)
	return string.format('require("plugins/%s")', name)
end

return require('packer').startup(function(use)
	-- essential
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Language server
	use { 'neovim/nvim-lspconfig', config = get_config('lsp') }
  	use 'williamboman/mason.nvim'
  	use 'williamboman/mason-lspconfig.nvim'

	use { 'hrsh7th/nvim-cmp', config = get_config('cmp'), requires = {
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/cmp-buffer',
	  'hrsh7th/cmp-path',
	  'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
	} }

	-- Utilities
	use { 'nvim-treesitter/nvim-treesitter', cmd = {'TSUpdate'}, config = get_config('treesitter') } -- better file parsing + highlighting
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', config = get_config('telescope') } -- fzf
	use 'tpope/vim-fugitive' -- git
	use 'airblade/vim-rooter' -- auto root directory
  use 'mbbill/undotree' -- undo tree
	-- use 'unblevable/quick-scope' -- highlight first letters of words
	-- use 'tpope/vim-surround' -- delete inside parentheses etc

	use { 'github/copilot.vim', config = get_config('copilot') } -- remove the need for a proper brain
	use { 'ThePrimeagen/harpoon', config = get_config('harpoon') } -- quick switch files

	-- use 'christoomey/vim-tmux-navigator' -- tmux navigation
	-- use { 'windwp/nvim-autopairs', config = function()
	--     require('nvim-autopairs').setup() 
	--   end} -- auto pairs
	use { 'folke/which-key.nvim', config = function()
		require('which-key').setup() 
	end} -- keybinds
	-- use { 'phaazon/hop.nvim', config = function()
	-- 	require('hop').setup() 
	-- end} -- quick jumps
	use { 'terrortylor/nvim-comment', config = function()
		require('nvim_comment').setup() 
	end} -- toggle comments
	-- use { 'akinsho/toggleterm.nvim', config = function()
	-- 	require('toggleterm').setup() 
	-- end} -- terminal

	-- Wiki
	use { 'vimwiki/vimwiki', config = get_config('vimwiki') } -- wiki

	-- Theming
	use { 'catppuccin/nvim', as = 'catppuccin', config = get_config('colorscheme') } -- colorscheme
	use { 'nvim-lualine/lualine.nvim', config = get_config('lualine'), requires = { 'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress' } } -- statusline

	-- Language specific
	-- -GLSL
	-- use { 'timtro/glslView-nvim', ft = 'glsl', config = get_config('languages/glsl') }
	-- use { 'tikhomirov/vim-glsl', ft = 'glsl' }
	  -- Rust
	use { 'simrat39/rust-tools.nvim', ft = 'rust', config = get_config('languages/rust') }
end)
