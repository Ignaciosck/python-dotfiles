return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()
		vim.keymap.set("n", "<Space>gk", ":Gitsigns preview_hunk_inline<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Space>gn", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Space>gN", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
	end,
}
