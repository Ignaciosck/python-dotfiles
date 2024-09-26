vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.fileformat = "unix"
local opts = { noremap = true, silent = true }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.o.mousemoveevent = true
vim.opt.hlsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
--vim.opt.undo = true
vim.opt.undofile = true
vim.g.mkdp_auto_start = 1
vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"
-- vim.opt.shell = "powershell"
vim.opt.swapfile = false
-- vim.g.mapleader = ' '  -- Establece el espacio como la tecla <leader>
-- Mapeos de ejemplo
map("n", "<Space>ve", ":vsplit $MYVIMRC<CR>", opts) -- Abre la configuración en un split vertical
map("n", "<Space>vs", "<cmd>vsplit<CR>", opts)      -- Recarga la configuración
-- Navigate vim panes better
vim.keymap.set("n", "<leader>/", ":normal gcc<CR>", { desc = "[/] Toggle comment line" })
-- <Esc> - exists visual mode.
-- :normal executes keystrokes in normal mode.
-- gv - restores selection.
-- gc - toggles comment
-- <CR> sends the command
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("v", "<leader>/", "<Esc>:normal gvgc<CR>", { desc = "[/] Toggle comment block" })
vim.keymap.set("n", "<C-c>", "<cmd>yank<CR>", opts)
vim.keymap.set("v", "<C-c>", "<cmd>yank<CR>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>yank<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-Left>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Down>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Up>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Right>", ":wincmd l<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>q", ":q<CR>")
vim.keymap.set("n", "<Space>h", ":nohlsearch <CR>", opts)
vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>gi", opts)
vim.keymap.set("n", "<c-s>", ":w<CR>", opts)
-- vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
-- vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
-- vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)
-- vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
-- vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
vim.wo.number = true
vim.wo.wrap = true -- Desactiva el ajuste de texto si prefieres des
-- Debugging
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set(
    "n",
    "<leader>bc",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    { desc = "Set conditional breakpoint" }
)
vim.keymap.set(
    "n",
    "<leader>bl",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
    { desc = "Set log point" }
)
vim.keymap.set("n", "<leader>tc", function()
    if vim.bo.filetype == "python" then
        require("dap-python").test_class()
    end
end)

vim.keymap.set("n", "<leader>tm", function()
    if vim.bo.filetype == "python" then
        require("dap-python").test_method()
    end
end)
vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear all breakpoints" })
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List breakpoints" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue execution" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dd", function()
    require("dap").disconnect()
    require("dapui").close()
end, { desc = "Disconnect and close UI" })
vim.keymap.set("n", "<leader>dt", function()
    require("dap").terminate()
    require("dapui").close()
end, { desc = "Terminate and close UI" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last debug session" })
vim.keymap.set("n", "<leader>di", function()
    require("dap.ui.widgets").hover()
end, { desc = "DAP Hover" })
vim.keymap.set("n", "<leader>d?", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end, { desc = "Show scopes in centered float" })
vim.keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "List frames" })
vim.keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "List DAP commands" })
vim.keymap.set("n", "<leader>de", function()
    require("telescope.builtin").diagnostics({ default_text = ":E:" })
end, { desc = "Show diagnostics with filter" })
