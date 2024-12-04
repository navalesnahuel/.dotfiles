return {
    -- Plenary.nvim (requerido por telescope)
    { 'nvim-lua/plenary.nvim' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup{}
        end
    },

    -- Monokai Pro 
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
            filter = "spectrum" -- Set the filter to spectrum
            })
            vim.cmd.colorscheme("monokai-pro")
        end,
    },

    -- Treesitter con TSUpdate
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- Treesitter Playground
    { 'nvim-treesitter/playground' },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },

    -- Undotree
    { 'mbbill/undotree' },

    -- Fugitive
    { 'tpope/vim-fugitive' },

    -- LSP Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
          {'neovim/nvim-lspconfig'}, -- Required for LSP
          {'williamboman/mason.nvim'}, -- LSP manager
          {'williamboman/mason-lspconfig.nvim'}, -- Mason integration with LSP
          {'hrsh7th/nvim-cmp'}, -- Autocompletion engine
          {'hrsh7th/cmp-nvim-lsp'}, -- LSP source for nvim-cmp
          {'hrsh7th/cmp-buffer'}, -- Buffer completion
          {'hrsh7th/cmp-path'}, -- Path completion
          {'L3MON4D3/LuaSnip'}, -- Snippets
          {'saadparwaiz1/cmp_luasnip'}, -- LuaSnip completion
        },
    },

    -- Codeium
    { 'Exafunction/codeium.vim' },

    -- TMUX Navigator
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",},
    },

    -- Barbar
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
            },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.9.1', -- optional: only update when a new 1.x version is released
    },

    {
      "linux-cultist/venv-selector.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
          { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
      lazy = false,
      branch = "regexp", -- This is the regexp branch, use this for the new version
      config = function()
          require("venv-selector").setup()
        end,
    },


}

