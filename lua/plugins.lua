local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
    "tanvirtin/monokai.nvim",
    -- Vscode-like pictograms
    {
	"onsails/lspkind.nvim",
	event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
	    "hrsh7th/nvim-cmp",
	    dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", -- path auto-completion
            "hrsh7th/cmp-cmdline", -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    --- Nvim Tree
    { 
    	"kyazdani42/nvim-tree.lua",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("config.nvim-tree")
        end,
    },

    --- AirLine
    {
        "vim-airline/vim-airline",
        config = function()
            require("config.vim-airline")
        end,
    },

    "vim-airline/vim-airline-themes",
    

    --- Neo Git plugins
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            {
                "nvim-telescope/telescope.nvim", -- optional
                dependencies = {
                    "nvim-treesitter/nvim-treesitter",
                    "nvim-lua/plenary.nvim",
                    "sharkdp/fd"
                },
                config = function()
                    require("config.telescope")
                end,
            },
            "ibhagwan/fzf-lua",              -- optional
            "echasnovski/mini.pick",         -- optional
        },
        config = true,
    },

    --- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = "cd app ; npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    --- Tagbar: a class outline viewer for VimEnter
    "preservim/tagbar",

    --- neofomat: a (neo)vim plugin for formatting code
    {
        "sbdchd/neoformat",
    },

    --- rust.vim: provide Rust file detection, syntax highlighting, formatting and so on
    {
        "rust-lang/rust.vim",
        config = function()
            require("config.rust-vim")
        end,
    },

    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })

            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
    },

    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            -- log_level = 'debug',
        },
        config = function()
            require("config.auto-session")
        end,
    },

    {
        
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("config.toggleterm")
        end,
        
    },
})
