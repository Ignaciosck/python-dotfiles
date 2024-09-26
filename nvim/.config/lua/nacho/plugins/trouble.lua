return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- settings without a patched font or icons
			{
				icons = true,
				fold_open = "v", -- icon used for open folds
				fold_closed = ">", -- icon used for closed folds
				indent_lines = false, -- add an indent guide below the fold icons

				use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
			},
		},
	},
	{
		-- {
		-- 	"folke/ts-comments.nvim",
		-- 	opts = {},
		-- 	event = "VeryLazy",
		-- 	enabled = vim.fn.has("nvim-0.10.0") == 1,
		-- },
	},
	{
		{
			"rachartier/tiny-inline-diagnostic.nvim",
			event = "VeryLazy",
			config = function()
				require("tiny-inline-diagnostic").setup()
			end,
		},
	},
}
