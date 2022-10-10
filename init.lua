vim.cmd("source ~/.vimrc")
local impatient_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/impatient.nvim'
if vim.fn.empty(vim.fn.glob(impatient_path)) > 0 then
    print("impatient.nvim not found! Cloning into", impatient_path)
    vim.fn.system({'git', 'clone', 'https://github.com/lewis6991/impatient.nvim', impatient_path})
    vim.cmd("helptags " .. impatient_path .. "/doc")
end
require("impatient")
require("packer").startup(function(use)    -- manage self
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    use { "yegappan/mru", cmd = { "MRU" } }
    use "airblade/vim-rooter"
    use "Kethku/golden-ratio"
    use { "mg979/vim-visual-multi", event = "BufEnter" }
    use { "PyGamer0/vim-apl", ft = "apl" }
    use "skywind3000/vim-terminal-help"
    use "tpope/vim-abolish"
    use "tpope/vim-surround"
    use "lewis6991/gitsigns.nvim"
    use "tversteeg/registers.nvim"
    use "winston0410/range-highlight.nvim"
    use { "psf/black", cmd = { "Black" } }
    use { "https://codeberg.org/ngn/k", rtp = "./vim_k" }
    use { "junegunn/vim-easy-align", keys = "<Plug>(EasyAlign)" }
    use "folke/which-key.nvim"
    use "tpope/vim-commentary"
    use "norcalli/nvim-colorizer.lua"
    use "Yggdroot/indentLine"
    use "rcarriga/nvim-notify"
    use "NTBBloodbath/galaxyline.nvim"
    use { "nvim-lua/plenary.nvim", module = "plenary" }
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
    use { "nvim-telescope/telescope.nvim", module = "telescope", cmd = { "Telescope" } }
    use { "nvim-telescope/telescope-frecency.nvim", opt = true }
end)
require("notify").setup({
    stages = "slide",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "d",
        TRACE = "t",
    },
})
vim.notify = require("notify")
require("colorizer").setup()
require("gitsigns").setup()
require("which-key").setup()
-- line: statusline
local gl = require("galaxyline")
local colors = require("galaxyline.themes.colors")["doom-one"]
local condition = require("galaxyline.condition")
local gls = gl.section

-- left side
-- bar
gls.left[1] = {
    RainbowRed = {
        provider = function()
            return "▊ "
        end,
        highlight = { colors.blue, colors.bg },
    }
}

-- mode
gls.left[2] = {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [""] = colors.blue,
                V = colors.blue,
                c = colors.magenta,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [""] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ["r?"] = colors.cyan,
                ["!"] = colors.red,
                t = colors.red,
            }
            vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
            return "  "
        end,
        highlight = { colors.red, colors.bg, "bold" },
    },
}

-- filename
gls.left[3] = {
    FileName = {
        provider = "FileName",
        condition = condition.buffer_not_empty,
        highlight = { colors.magenta, colors.bg, "bold" }
    }
}

-- lsp
gls.left[4] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.bg }
   }
}

gls.left[5] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.yellow, colors.bg }
    }
}

gls.left[6] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = { colors.orange, colors.bg }
    }
}

gls.left[7] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = { colors.green, colors.bg }
    }
}

-- right
-- file encoding
gls.right[1] = {
    FileEncode = {
        provider = "FileEncode",
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.green, colors.bg, "bold" },
    },
}

-- git
gls.right[2] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.violet, colors.bg, "bold" },
    },
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        highlight = { colors.violet, colors.bg, "bold" },
    },
}

-- bar
gls.right[4] = {
    RainbowBlue = {
        provider = function()
            return "  ▊"
        end,
        highlight = { colors.blue, colors.bg },
    },
}
-------------------------
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
    })
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = { capabilities = capabilities }
    server:setup(opts)
end)
