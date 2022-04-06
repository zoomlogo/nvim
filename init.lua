-- is impatient available?
local impatient_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/impatient.nvim'
if vim.fn.empty(vim.fn.glob(impatient_path)) > 0 then
    print("impatient.nvim not found! Cloning into", impatient_path)
    vim.fn.system({'git', 'clone', 'https://github.com/lewis6991/impatient.nvim', impatient_path})
    vim.cmd("helptags " .. impatient_path .. "/doc")
end

-- load
require("impatient")
require("conf")
