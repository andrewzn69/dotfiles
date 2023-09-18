local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'rafamadriz/friendly-snippets',

  'lukas-reineke/indent-blankline.nvim', -- indent lines
  'nyoom-engineering/oxocarbon.nvim',

  'nvim-lualine/lualine.nvim', -- Statusline
  'nvim-lua/plenary.nvim',     -- Common utilities
  'onsails/lspkind-nvim',      -- vscode-like pictograms

  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',              -- nvim-cmp ource for buffer words
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-nvim-lsp',            -- nvim-cmp source for neovim's built-in LSP
  'hrsh7th/nvim-cmp',                -- Completion
  'hrsh7th/vim-vsnip',
  'neovim/nvim-lspconfig',           -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'nvim-treesitter/nvim-treesitter',

  'glepnir/lspsaga.nvim',         -- LSP UIs
  'kyazdani42/nvim-web-devicons', -- File icons
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  'norcalli/nvim-colorizer.lua',
  'folke/zen-mode.nvim',
  'iamcco/markdown-preview.nvim',
  'akinsho/nvim-bufferline.lua',
  -- use 'github/copilot.vim'
  'sindrets/diffview.nvim', -- git diff tool
  'andweeb/presence.nvim',  -- Rich Presence For Discord

  'aurum77/live-server.nvim',

  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim', -- For git blame & browse

  'Eandrju/cellular-automaton.nvim',

  'kaarmu/typst.vim', -- typst

  'elkowar/yuck.vim', -- yuck
}

local opts = {}

require("lazy").setup(plugins, opts)
