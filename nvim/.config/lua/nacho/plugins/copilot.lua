-- return {
-- 	-- Otras configuraciones de plugins...
--
-- 	{
-- 		"github/copilot.vim",
-- 		config = function()
-- 			-- Aquí puedes poner cualquier configuración inicial de copilot.nvim que necesites.
-- 			-- Por ejemplo, si copilot.nvim tuviera una función de configuración sería algo así:
-- 			-- require("copilot").setup({})
-- 			-- Nota: Reemplaza el comentario anterior por la configuración real si es necesaria.
-- 		end,
-- 	},
--
-- 	-- Más configuraciones de plugins...
-- }

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true,
				},
			})
		end,
	},
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}
