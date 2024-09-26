return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "AndreM222/copilot-lualine" },
    config = function()
        local lazy_status = require("lazy.status") -- Configurar la cuenta de actualizaciones pendientes de lazy

        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = {
                    {
                        function()
                            return require("lualine.utils.mode").get_mode()
                        end,
                    },
                },
                lualine_b = {
                    { "branch" },
                    { "diff" },
                    { "diagnostics" },
                },
                lualine_c = {
                    {
                        -- Customize the filename part of lualine to be parent/filename
                        "filename",
                        file_status = true, -- Displays file status (readonly status, modified status)
                        newfile_status = false, -- Display new file status (new file means no write after created)
                        path = 4, -- 0: Just the filename
                        -- 1: Relative path
                        -- 2: Absolute path
                        -- 3: Absolute path, with tilde as the home directory
                        -- 4: Filename and parent dir, with tilde as the home directory
                        symbols = {
                            modified = "[+]", -- Text to show when the file is modified.
                            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                        },
                    },
                },
                lualine_x = {
                    { "copilot" },
                    { "encoding" },
                    { "filetype" },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
