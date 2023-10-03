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
-- ksdfjlsdjfl kdsjlk

local plugins = {
  'nyoom-engineering/oxocarbon.nvim',           -- color scheme

  'rafamadriz/friendly-snippets',               -- collection of snippets
  'hrsh7th/vim-vsnip',                          -- lsp snippets
  'hrsh7th/cmp-vsnip',                          -- nvim-cmp source for vim-vsnip

  'nvim-lua/plenary.nvim',                      -- common utilities
  'onsails/lspkind-nvim',                       -- vscode-like pictograms

  'hrsh7th/cmp-path',                           -- filesystem paths
  'hrsh7th/cmp-cmdline',                        -- nvim-cmp source for vim's cmdline
  'hrsh7th/cmp-buffer',                         -- nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp',                       -- nvim-cmp source for neovim's built-in lsp
  'hrsh7th/nvim-cmp',                           -- completion
  'neovim/nvim-lspconfig',                      -- lsp
  'jose-elias-alvarez/null-ls.nvim',            -- use neovim as a language server to inject lsp diagnostics, code actions, and more via lua
  'williamboman/mason.nvim',                    -- managing lsp servers
  'williamboman/mason-lspconfig.nvim',          -- bridge between mason.nvim and lspconfig
  'glepnir/lspsaga.nvim',                       -- lsp UIs
  'nvim-treesitter/nvim-treesitter',            -- better code highlighting

  'kaarmu/typst.vim',                           -- typst
  'elkowar/yuck.vim',                           -- yuck

  'nvim-telescope/telescope.nvim',              -- file browser
  'nvim-telescope/telescope-file-browser.nvim', -- creating, renaming, deleting files

  'windwp/nvim-autopairs',                      -- autopairs for brackets, etc.
  'windwp/nvim-ts-autotag',                     -- autoclose and autorename html tags

  'numToStr/Comment.nvim',                      -- smart comments
  'norcalli/nvim-colorizer.lua',                -- colorizer for hex values
  'folke/zen-mode.nvim',                        -- zen mode
  'nvim-lualine/lualine.nvim',                  -- statusline
  'akinsho/nvim-bufferline.lua',                -- bufferline
  'lukas-reineke/indent-blankline.nvim',        -- indent lines
  'kyazdani42/nvim-web-devicons',               -- file icons

  {                                             -- markdown preview
    'iamcco/markdown-preview.nvim',
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  'aurum77/live-server.nvim', -- live server for html

  'lewis6991/gitsigns.nvim',  -- git inline decorations
  'dinhhuy258/git.nvim',      -- for git blame & browse
}

local opts = {}

require("lazy").setup(plugins, opts)
