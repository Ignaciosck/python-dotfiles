return {
	-- Plugin para integración LSP con nvim-cmp
	{ "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help" },

	-- Configuración de LuaSnip y sus dependencias
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- Integración de LuaSnip con nvim-cmp
			"rafamadriz/friendly-snippets", -- Conjunto de snippets listos para usar
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- Carga perezosa de snippets de VSCode
		end,
	},

	-- Configuración principal de nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		config = function()
			-- local lspkind = require("lspkind")
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						max_width = 50,
					}),
				},

				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- Integración de expansión de snippets con LuaSnip
					end,
				},
				window = {
					completion = cmp.config.window.bordered(), -- Opcional: Ventanas con bordes para el autocompletado
					-- documentation = cmp.config.window.bordered(), -- Opcional: Ventanas con bordes para la documentación
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Acepta la sugerencia al presionar Enter
				}),
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- Usar LuaSnip como fuente para el autocompletado
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
