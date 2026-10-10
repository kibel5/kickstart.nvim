-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Load each custom plugin module after the built-in plugins have been set up.
-- `vim.fs.dir()` iteration order is unspecified, so interdependent plugins
-- should be configured together in a single module.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    require('custom.plugins.' .. file_name:gsub('%.lua$', ''))
  end
end
