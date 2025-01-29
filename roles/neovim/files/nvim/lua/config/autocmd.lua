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

vim.api.nvim_create_autocmd('FileType', {
	desc = 'Automatically activate Quarto when entering markdown buffer',

	group = vim.api.nvim_create_augroup('start_quarto', { clear = true }),
  pattern = "markdown",
	callback = function (opts)
			require("quarto").activate()
	end
})
  
-- Automatically start VimTeX compilation on file save
-- local group = vim.api.nvim_create_augroup("VimtexAutoCompile", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- pattern = "*.tex",
-- group = group,
-- callback = function()
-- vim.cmd("VimtexCompile")
-- end,
-- })
