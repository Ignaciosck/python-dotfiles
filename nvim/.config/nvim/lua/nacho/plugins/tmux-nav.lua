return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		require("nvim-tmux-navigation").setup({
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				up = "<M-Up>",
				down = "<M-Down>",
				left = "<M-Left>",
				right = "<M-Right>",
				-- last_active = "<C-\\>",
				-- next = "<C-Space>",
			},
		})
	end,
}
