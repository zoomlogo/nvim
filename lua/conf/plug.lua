-- plug: plugins
return require("packer").startup(function(use)
    -- manage self
    use "wbthomason/packer.nvim"

    -- impatient
    use "lewis6991/impatient.nvim"

    -- helpful
    use "yegappan/mru"
    use "airblade/vim-rooter"
    use "Kethku/golden-ratio"
    use "mg979/vim-visual-multi"
    use "PyGamer0/vim-apl"
    use "skywind3000/vim-terminal-help"
    use "tpope/vim-abolish"
    use "tpope/vim-surround"
    use "lewis6991/gitsigns.nvim"
    use "tversteeg/registers.nvim"
    use "winston0410/range-highlight.nvim"
    use "psf/black"
    use { "https://codeberg.org/ngn/k", as = "vim_k", rtp = "vim_k" }
    use "junegunn/vim-easy-align"
    use "folke/which-key.nvim"

    -- looks
    use "norcalli/nvim-colorizer.lua"
    use "Yggdroot/indentLine"
    use "PyGamer0/font_changer.vim"
    use "PyGamer0/colorscheme_changer.vim"
    use "rcarriga/nvim-notify"
    use "NTBBloodbath/galaxyline.nvim"
    use "junegunn/rainbow_parentheses.vim"

    -- colors
    use "rktjmp/lush.nvim"
    use "PyGamer0/defined.nvim"
    use "cpea2506/one_monokai.nvim"

    -- required by some plugins
    use "nvim-lua/plenary.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use {
        "hrsh7th/nvim-cmp", requires = {
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        }
    }

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-frecency.nvim"
end)
