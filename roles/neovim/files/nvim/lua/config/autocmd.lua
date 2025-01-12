-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
local optional_group = vim.api.nvim_create_augroup("MyTexGroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "tex",
  group = optional_group,
  command = "TSBufDisable highlight",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "tex",
  group = optional_group,
  command = "TSBufDisable highlight",
})
