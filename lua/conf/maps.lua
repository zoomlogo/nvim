-- maps: mappings
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

-- map leader
nmap("<space>", "<nop>")
vim.g.mapleader = " "

-- maps
nmap("Q", "@q")
nmap("<leader>w", ":w<CR>")
nmap("<leader>t", ":tabnew<CR>")
nmap("<leader>p", ":tabnext<CR>")
nmap("<leader>h", ":vsplit<CR>")
nmap("<leader>v", ":split<CR>")
nmap("<leader>cd", ":cd %/..<CR>")

-- lsp
nmap("<F2>", ":lua vim.lsp.diagnostic.goto_next()<CR>")
nmap("<F3>", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
nmap("gD", ":lua vim.lsp.buf.declaration()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("<c-r>", ":lua vim.lsp.buf.rename()<CR>")

-- telescope.nvim
nmap("<leader>ff", ":Telescope find_files<CR>")
nmap("<leader>fg", ":Telescope live_grep<CR>")

-- mru
nmap("<leader>m", ":MRU<CR>")

-- mine
nmap("<leader>cf", ":ChangeFont<CR>")
nmap("<leader>cc", ":ChangeColor<CR>")
