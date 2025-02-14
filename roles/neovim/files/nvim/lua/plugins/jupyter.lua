-- Keymaps for normal mode
local nmap = function(key, command, opts)
	vim.keymap.set("n", key, command, opts)
end

-- Keymaps for visual mode
local vmap = function(key, command, opts)
	vim.keymap.set("v", key, command, opts)
end

return {
	{
		"3rd/image.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		-- dependencies = {
		--   {
		--     "nvim-treesitter/nvim-treesitter",
		--     build = ":TSUpdate",
		--     config = function()
		--       require("nvim-treesitter.configs").setup({
		--         ensure_installed = { "markdown" },
		--         highlight = { enable = true },
		--       })
		--     end,
		--   },
		-- },
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki", "quarto" }, -- markdown extensions (ie. quarto) can go here
				},
				-- neorg = {
				--   enabled = true,
				--   clear_in_insert_mode = false,
				--   download_remote_images = true,
				--   only_render_image_at_cursor = false,
				--   filetypes = { "norg" },
				-- },
			},
			max_width = 100, -- tweak to preference
			max_height = 12, -- ^
			max_height_window_percentage = math.huge, -- this is necessary for a good experience
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			kitty_method = "normal",
		},
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				chunks = "all",
				languages = { "r", "python", "html" }, -- "julia", "bash",
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			codeRunner = {
				enabled = true,
				default_method = "molten", -- "molten", "slime", "iron" or <function>
				ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
				-- Takes precedence over `default_method`
				never_run = { "yaml" }, -- filetypes which are never sent to a code runner
			},
		},
		init = function()
			local runner = require("quarto.runner")
			vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
			vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
			vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
			vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
			vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
			vim.keymap.set("n", "<localleader>RA", function()
				runner.run_all(true)
			end, { desc = "run all cells of all languages", silent = true })
		end,
	},
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_virt_text_output = false
			vim.g.molten_virt_lines_off_by_1 = true

			-- Set keybinds for Molten
			nmap(
				"<localleader>mos",
				":noautocmd MoltenEnterOutput<CR>",
				{ desc = "move into output window", silent = true }
			)
			nmap("<localleader>mr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
			nmap("<localleader>ml", ":MoltenEvaluateLine<CR>", { desc = "evaluate line", silent = true })
			nmap("<localleader>me", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
			vmap(
				"<localleader>mv",
				":<C-u>MoltenEvaluateVisual<CR>gv",
				{ desc = "execute visual selection", silent = true }
			)
			nmap("<localleader>ms", ":MoltenShowOutput<CR>", { desc = "show output window", silent = true })
			nmap("<localleader>mh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
			nmap("<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
			nmap("<localleader>mc", ":Molten", { desc = "", silent = true })

			-- if you work with html outputs:
			vim.keymap.set(
				"n",
				"<localleader>mx",
				":MoltenOpenInBrowser<CR>",
				{ desc = "open output in browser", silent = true }
			)
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
				output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
				force_ft = nil, -- Default filetype. Don't change unless you know what you are doing
				custom_language_formatting = {
					python = {
						extension = "md",
						style = "markdown",
						force_ft = "markdown", -- you can set whatever filetype you want here
					},
				},
			})
			vim.g.jupytext_fmt = "light"
		end,
	},
}
