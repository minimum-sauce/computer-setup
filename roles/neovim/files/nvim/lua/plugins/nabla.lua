return {
	"jbyuki/nabla.nvim",
	enabled = true,
	init = function()
		vim.keymap.set(
			"n",
			"<leader>lp",
			'<cmd> lua require("nabla").popup()<CR>',
			{ desc = "create popup for latex math" }
		)

		vim.keymap.set(
			"n",
			"<leader>cn",
			'<cmd> lua require("nabla").toggle_virt() <CR>',
			{ desc = "Start inline latex math" }
		)
	end,
}
