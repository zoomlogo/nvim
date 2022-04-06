-- lsp: lsp / ts / telescope configurations
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
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
    })
})
require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = {}
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    server:setup()
end)
require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "c", "cpp", "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, 
    },
    indent = {
        enable = true,
    },
})
