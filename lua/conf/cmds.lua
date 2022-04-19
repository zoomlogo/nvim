vim.cmd([[
autocmd VimLeave * set guicursor=a:ver25
autocmd BufReadPost * silent! normal! g`"zv
autocmd TextYankPost * lua vim.highlight.on_yank{higroup="IncSearch", timeout=150, on_visual=true}
autocmd FileType make set noexpandtab
]])
