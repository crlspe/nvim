local vim = vim
local Plug = vim.fn['plug#']
-------------------------------------------------------------------------------
-- PLUG PLUGIN MANAGER
-------------------------------------------------------------------------------
vim.call('plug#begin')
-------------------------------------------------------------------------------
Plug('nvim-tree/nvim-web-devicons')
Plug('akinsho/bufferline.nvim', { ['tag'] = '*' })
Plug('akinsho/toggleterm.nvim')
Plug('preservim/nerdtree')
-- Themes ---------------------------------------------------------------------
Plug('Mofiqul/vscode.nvim')
Plug('embark-theme/vim')
-------------------------------------------------------------------------------
-- Code Helpers ---------------------------------------------------------------
Plug('Raimondi/delimitMate')
Plug('tpope/vim-commentary')
Plug('mg979/vim-visual-multi')
Plug('joshdick/onedark.vim')
-------------------------------------------------------------------------------
-- Programing Languages Helpers
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})	-- Syntax Parser
Plug('williamboman/mason.nvim')									-- LSP REQUIREMENTS
Plug('williamboman/mason-lspconfig.nvim')						-- LSP REQUIREMENTS
Plug('neovim/nvim-lspconfig')									-- LSP REQUIREMENTS
Plug('hrsh7th/nvim-cmp')										-- LSP REQUIREMENTS
Plug('hrsh7th/cmp-nvim-lsp')									-- LSP REQUIREMENTS
Plug('L3MON4D3/LuaSnip')										-- LSP REQUIREMENTS
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})		-- LSP REQUIREMENTS
-------------------------------------------------------------------------------
vim.call('plug#end')
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- COMMENT THIS LINE AFTER THE FIRST RUN of :PlugInstall
-- if true then return end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- PLUGIN CONFIGURATION
-------------------------------------------------------------------------------
vim.g.lightline = {  colorscheme = 'wombat' }
-------------------------------------------------------------------------------
-- TOGGLE TERM
require("toggleterm").setup()
-------------------------------------------------------------------------------
-- BUFFER LINE
vim.opt.termguicolors = true
require("bufferline").setup{}
-------------------------------------------------------------------------------
-- TREE SITTER
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
-------------------------------------------------------------------------------
-- LSP-ZERO
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
-------------------------------------------------------------------------------
--- MASON.NVIM SETUP
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
---------------------------------------------------------------------------------
-- AUTOCOMPLETE
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
  }),
})
-----------------------------------------------------------------------------------
-- Open File Manager on Start (NERDTree)
--vim.cmd([[autocmd VimEnter * NERDTree]])
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- VIM SETTINGS
-----------------------------------------------------------------------------------
-- SET COLORSCHEME
vim.cmd('colorscheme vscode')
-----------------------------------------------------------------------------------
-- FOR TRANSPARENT BACKGROUND
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
-----------------------------------------------------------------------------------
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set number')
vim.cmd('set shiftwidth=4')
vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set nowrap')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set noswapfile')
vim.cmd('set nobackup')
vim.cmd('set showcmd')
vim.cmd('set scrolloff=10')
vim.cmd('set t_Co=256')
-----------------------------------------------------------------------------------
-- KEYMAPS
-----------------------------------------------------------------------------------
function vimCmd(cmd)
    vim.cmd("normal " .. cmd)
end
-- Replacing key mapping for gcc Comments
vim.api.nvim_set_keymap('n', '<C-_>', '<cmd>lua vimCmd("gcc")<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-_>', '<cmd>lua vimCmd("gcc")<CR>', {noremap = true, silent = true})
-- Enter command faster
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('i', ';;', '<Esc>', {noremap = true})
-- Convert word to Upper case
vim.api.nvim_set_keymap('n', '<C-u>', 'gUiw', {noremap = true, silent = true})
-- Convert word to Lower case
vim.api.nvim_set_keymap('n', '<C-l>', 'guiw', {noremap = true, silent = true})
-- Cut line Ctrl + x
vim.api.nvim_set_keymap('n', '<C-x>', 'dd', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>ddi', {noremap = true, silent = true})
-- Create a key mapping to save the file with Ctrl + s
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', {noremap = true})
-- Move Line Up or Down
vim.api.nvim_set_keymap('n', '<M-Up>', ':move -2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-Down>', ':move +1<CR>==', {noremap = true})
-----------------------------------------------------------------------------------
-- MULTI CURSOR Assign key mappings
vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(VM-Find-Under)', {})
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc><Plug>(VM-Find-Under)', {})
vim.api.nvim_set_keymap('x', '<C-d>', '<Plug>(VM-Find-Subword-Under)', {})
-- Moving Between Opened Buffers (Bufferline)
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>==', {noremap = true})
-- TOGGLE TERM Convinience Keymaps
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-1>', ':ToggleTerm 1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-2>', ':ToggleTerm 2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-3>', ':ToggleTerm 3<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-4>', ':ToggleTerm 4<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>:ToggleTerm<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<M-1>', '<Esc>:ToggleTerm 1<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<M-2>', '<Esc>:ToggleTerm 2<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<M-3>', '<Esc>:ToggleTerm 3<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<M-4>', '<Esc>:ToggleTerm 4<CR>', {noremap = true})
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n><C-t>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-1>', [[<C-\><C-n><C-t>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-2>', [[<C-\><C-n><C-t>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-3>', [[<C-\><C-n><C-t>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-4>', [[<C-\><C-n><C-t>]], {noremap = true})
-----------------------------------------------------------------------------------
-- Fuzzy find files in folder (No plugins)
vim.cmd('set path+=**')
vim.cmd('set wildmenu')
vim.api.nvim_set_keymap('n', '<C-p>', ':find ', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-p>', ':find ', {noremap = true})
-- Move through file buffers
vim.api.nvim_set_keymap('n', '<M-p>', ':b ', {noremap = true})
vim.api.nvim_set_keymap('i', '<M-p>', ':b ', {noremap = true})
-----------------------------------------------------------------------------------
--  Text Selection
vim.api.nvim_set_keymap('i', '<S-End>', '<Esc>v$', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-End>', 'v$', {noremap = true})

vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Left>',  '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Down>',  '<Esc>v', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Up>',	  '<Esc>v', {noremap = true})

vim.api.nvim_set_keymap('n', '<S-Right>', 'v', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Left>',  'v', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Down>',  'v', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Up>',    'v', {noremap = true})

-- Adding Lines Normal Mode
vim.api.nvim_set_keymap('n', '<Enter>', 'O<Esc>', {noremap = true})
-- Maps Ctrl + z to :undo
vim.api.nvim_set_keymap('n', '<C-z>', ':undo<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>:undo<CR>', {noremap = true, silent = true})
-- Maps Ctrl + Shift + z to redo
vim.api.nvim_set_keymap('n', '<C-S-z>', ':redo<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-S-z>', '<Esc>:redo<CR>', {noremap = true, silent = true})
-- Maps Ctrl + c to yank text
vim.api.nvim_set_keymap('n', '<C-c>', 'yy<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>yy<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {noremap = true, silent = true})
-- Maps Ctrl + v to paste text
vim.api.nvim_set_keymap('n', '<C-v>', 'P', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>P<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-v>', 'p', {noremap = true, silent = true})
