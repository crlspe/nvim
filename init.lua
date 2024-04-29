local vim = vim
local Plug = vim.fn['plug#']
-------------------------------------------------------------------------------
-- PLUG PLUGIN MANAGER
-------------------------------------------------------------------------------
vim.call('plug#begin')
-------------------------------------------------------------------------------
-- Plug('')
-- Plug('vim-airline/vim-airline')
Plug('nvim-tree/nvim-web-devicons')
Plug('akinsho/bufferline.nvim')
Plug('akinsho/toggleterm.nvim')

-- Themes --------------------------------------------------------------------- 
Plug('https://github.com/junegunn/seoul256.vim.git')
Plug('folke/tokyonight.nvim')
Plug('rose-pine/neovim')
-------------------------------------------------------------------------------
-- Code Helpers ---------------------------------------------------------------
Plug('Raimondi/delimitMate')
Plug('tpope/vim-commentary')
Plug('mg979/vim-visual-multi')
-------------------------------------------------------------------------------
-- Programing Languages Helpers 
-- Plug('mfussenegger/nvim-lint') -- Linter Code
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'}) -- Syntax Parser
Plug('williamboman/mason.nvim')								-- LSP REQUIREMENTS
Plug('williamboman/mason-lspconfig.nvim')					-- LSP REQUIREMENTS
Plug('neovim/nvim-lspconfig')								-- LSP REQUIREMENTS
Plug('hrsh7th/nvim-cmp')									-- LSP REQUIREMENTS
Plug('hrsh7th/cmp-nvim-lsp')								-- LSP REQUIREMENTS
Plug('L3MON4D3/LuaSnip')									-- LSP REQUIREMENTS
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v3.x'})	-- LSP REQUIREMENTS 
-------------------------------------------------------------------------------
vim.call('plug#end')
-------------------------------------------------------------------------------

-----------------------------------------------------
-- UNCOMMENT THIS LINE AFTER THE FIRST PlugInstall 
if true then return end
------------------------------------------------------

-------------------------------------------------------------------------------
-- PLUGIN CONFIGURATION
-------------------------------------------------------------------------------
-- TOGGLE TERM 
require("toggleterm").setup()
-------------------------------------------------------------------------------
-- LINTER
--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    require("lint").try_lint()
--    require("lint").try_lint("cspell")
--    require("lint").try_lint("golangcilint")
--  end,
--})
-------------------------------------------------------------------------------
-- TOKYO NIGHT THEME CONFIGURATION
local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"
    local border = "#547998"

    require("tokyonight").setup({
      style = "night",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    })
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
  }),
})
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- VIM SETTINGS
-----------------------------------------------------------------------------------
vim.cmd('colorscheme tokyonight')						-- COLORSCHEMA
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})			-- TRANSPARENT BACKGROUND
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})	-- TRANSPARENT BACKGROUND
-----------------------------------------------------------------------------------
vim.cmd('set number')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
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
vim.api.nvim_set_keymap('n', '<Tab>', ':bNext<CR>==', {noremap = true})
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})
-- TOGGLE TERM Convinience Keymaps
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
