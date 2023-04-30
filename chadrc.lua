---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'ayu_dark',
  theme_toggle = {'ayu_dark', 'ayu_light'},
  lsp_semantic_tokens = true
  -- statusline = {
  --   theme = "default"
  -- }
}
 M.plugins = 'custom.plugins'
 M.mappings = require 'custom.mappings'
 return M
