-- other: configuration for other plugins
vim.cmd("colorscheme defun")
vim.g.terminal_shell = "zsh"
vim.g.indentLine_char = "▏"
vim.g.font_changer_fonts = {
    "sevka,agave_NF_r:h13",
    "SF_Mono,agave_NF_r:h13",
    "agave_NF_r:h13",
}
vim.g.colorscheme_changer_colors = {
    "defined",
    "jellybeans-nvim",
    "cemant",
}
vim.cmd("let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]")
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
