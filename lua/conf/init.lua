-- start by loading nvim settings
require("conf.nset")
require("conf.maps")
require("conf.cmds")
-- then plugins
require("conf.plug")
-- then configuration for plugins
require("conf.line")   -- galaxyline
require("conf.lsp")    -- related to lsp and treesitter
require("conf.other")  -- other plugins
