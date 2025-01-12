return {
  "L3MON4D3/LuaSnip",
  build = (function()
  -- Build Step is needed for regex support in snippets.
  -- This step is not supported in many windows environments.
  -- Remove the below condition to re-enable on windows.
  if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
    return
  end
    return "make install_jsregexp"
  end)(),
  dependencies = {
  -- `friendly-snippets` contains a variety of premade snippets.
  --  See the README about individual language/framework/plugin snippets:
  --  https://github.com/rafamadriz/friendly-snippets
    {
      'rafamadriz/friendly-snippets',
      config = function()
	-- require('luasnip.loaders.from_vscode').lazy_load()
	require('luasnip.loaders.from_lua').lazy_load({paths = "~/.config/nvim/LuaSnip/"})
      end,
    },
  },

  callback = function(event)
    local ls = require("luasnip")
    vim.keymap.set({"i"}, "<C-k>",
      function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-l>",
      function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-h>",
      function() ls.jump(-1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-e>",
      function()
        if ls.choice_active() then
	  ls.change_choice(1) 
	end
      end, {silent = true})
  end,
}
