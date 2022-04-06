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
