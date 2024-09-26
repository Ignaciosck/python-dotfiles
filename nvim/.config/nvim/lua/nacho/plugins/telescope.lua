return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function()
			-- Optional: setup telescope before loading the extension
			require("telescope").setup({
				extensions = {
					advanced_git_search = {
						-- Configurations for advanced_git_search
					},
				},
			})

			require("telescope").load_extension("advanced_git_search")
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					advanced_git_search = {
						git = {
							current_file = true, -- true: search in the current file, false: search in the entire repo
						},
					},
					undo = {
						use_delta = true,
						use_custom_command = nil, -- setting this implies `use_delta = false`
						side_by_side = false,
						vim_diff_opts = { ctxlen = vim.o.scrolloff },
						entry_format = "state #$ID, $STAT, $TIME",
					},
				},
				mappings = {
					i = {
						["<C-1>"] = require("telescope.actions").preview_scrolling_up,
						["<C-2>"] = require("telescope.actions").preview_scrolling_down,
					},
				},
				defaults = {
					wrap_results = true,
					layout_strategy = "horizontal",
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Space>tf", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<Space>to", builtin.oldfiles, { desc = "Old Files" })
			-- vim.keymap.set("n", "<Space>tg", builtin.live_grep, {})
			vim.keymap.set("n", "<Space>th", builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set("n", "<Space>tb", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<Space>ts", builtin.lsp_document_symbols, { desc = "LSP Document Symbols" })
			vim.keymap.set(
				"n",
				"<Space>tp",
				":Telescope projects<CR>",
				{ noremap = true, silent = true, desc = "Projects" }
			)
			vim.keymap.set("n", "<Space>ti", "<cmd>AdvancedGitSearch<CR>", { desc = "Advanced Git Search" })
			vim.keymap.set("n", "<Space>tu", "<cmd>Telescope undo<CR>", { desc = "Undo Tree" })
			vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep_args<CR>", { desc = "Live Grep Args" })
			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo Telescope" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("advanced_git_search")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("undo")
		end,
	},
}
