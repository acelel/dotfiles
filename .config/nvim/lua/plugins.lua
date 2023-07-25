vim.cmd [[packadd packer.nvim]]
function get_config(name)
	return string.format('require("plugins/%s")', name)
end

return require('packer').startup(
function(use)
	-- essential
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Language server / Linter / everything i guess
	use { 'neoclide/coc.nvim', branch = 'release', config = get_config('coc') }

	-- Utilities
	use { 'nvim-treesitter/nvim-treesitter', cmd = {'TSUpdate'}, config = get_config('treesitter') } -- better file parsing + highlighting
	use { 'kyazdani42/nvim-tree.lua', config = get_config('nvimtree') } -- file explorer
	use 'tpope/vim-fugitive' -- git
	use 'airblade/vim-rooter' -- auto root directory
	use 'vim-scripts/auto-pairs-gentle' -- auto pairs
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' } -- fzf
	use { 'terrortylor/nvim-comment', requires = { 'nvim-lua/plenary.nvim' }} -- toggle comments
	use 'unblevable/quick-scope' -- highlight first letters of words
	use 'tpope/vim-surround' -- delete inside parentheses etc
	use { 'github/copilot.vim', config = get_config('copilot') } -- remove the need for a proper brain
	use { 'ThePrimeagen/harpoon', config = get_config('harpoon') } -- quick switch files
	use 'christoomey/vim-tmux-navigator' -- tmux navigation
	use { 'folke/which-key.nvim', config = function()
		require('which-key').setup() 
	end} -- keybinds
	use { 'phaazon/hop.nvim', config = function()
		require('hop').setup() 
	end} -- quick jumps
	use { 'terrortylor/nvim-comment', config = function()
		require('nvim_comment').setup() 
	end} -- toggle comments
	use { 'akinsho/toggleterm.nvim', config = function()
		require('toggleterm').setup() 
	end} -- terminal

	-- Wiki
	use { 'vimwiki/vimwiki', config = get_config('vimwiki') } -- wiki

	-- Theming
	use { 'catppuccin/nvim', as = 'catppuccin', config = get_config('cappuccin') } -- colorscheme
	use { 'nvim-lualine/lualine.nvim', config = get_config('lualine'), requires = { 'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress' } } -- statusline

	-- Language specific
	-- -GLSL
	use { 'timtro/glslView-nvim', ft = 'glsl', config = get_config('glsl') }
	use { 'tikhomirov/vim-glsl', ft = 'glsl' }
end
)
