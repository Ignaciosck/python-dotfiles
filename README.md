# Dotfiles

<a href="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config"><img src="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config"><img src="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config"><img src="https://dotfyle.com/Ignaciosck/dotfiles-nvim-config/badges/plugin-manager?style=for-the-badge" /></a>

Tmux + Zsh (syntax highlight, completion, suggestions)
Neovim environment for Python developing (LSP, Debugger, Completion, Snippets, etc)
>⚠️ **Warning: keybinds may not be beginner friendly**

## Install Instructions

 > Install requires Neovim 0.9+.
## Auto install

```
bash install_script.sh
```

## Manual installation
If script doesnt work for you (😹😹😹😹🫵)
Clone the repository:

```sh
git clone https://github.com/Ignaciosck/dotfiles.git ~/.config/Ignaciosck/dotfiles
```

Use GNU Stow to symlink the config files (while inside dotfiles):

```sh
stow -d ~/.config/Ignaciosck/dotfiles -t ~ *
```
## Tmux Configuration
The tmux configuration in this repository includes the following features and customizations:

* Terminal and Colors: Configures the terminal to use screen-256color and enables RGB color support.
* Custom Keybindings: Changes the tmux prefix key to **Ctrl-a** instead of the default **Ctrl-b**. 
    
    Adds new shortcuts to split windows horizontally (|) and vertically (-), resize panes (j, k, h, l), maximize/restore a pane (m), and reload the configuration (r).
* Vim-style Copy Mode: Enables Vim-like keybindings in copy mode, adding shortcuts for selecting (v) and copying text (y).
* Neovim Integration: Detects if Neovim is running and adjusts the behavior of Alt + arrow key combinations to either navigate tmux panes or move within Neovim.
* Session Management:
    * Integrates with [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) and [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) to automatically save and restore sessions, allowing manual session saving with Ctrl-a S.
    * Includes support for the [nvim-tmux-navigator](https://github.com/alexghergh/nvim-tmux-navigation) plugin to facilitate seamless navigation between tmux panes and Neovim windows.
* Mouse Mode: Enables mouse support for interacting with tmux panes.
### Plugins
 Uses [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) to manage additional plugins like tmux-resurrect, tmux-continuum, and vim-tmux-navigator.

## Neovim Plugins
This configuration was designed to work in Unix environments, especially those managing Python backends. The setup enhances productivity, supports various development workflows, and includes tools for code completion, debugging, syntax highlighting, and project management. Here's an overview of the key plugins included:
### colorscheme

+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
### file-explorer

+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [aaronhallaert/advanced-git-search.nvim](https://dotfyle.com/plugins/aaronhallaert/advanced-git-search.nvim)
+ [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [nvimdev/lspsaga.nvim](https://dotfyle.com/plugins/nvimdev/lspsaga.nvim)
+ [soulis-1256/eagle.nvim](https://dotfyle.com/plugins/soulis-1256/eagle.nvim)
+ [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [aznhe21/actions-preview.nvim](https://dotfyle.com/plugins/aznhe21/actions-preview.nvim)
+ [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
+ [rachartier/tiny-inline-diagnostic.nvim](https://dotfyle.com/plugins/rachartier/tiny-inline-diagnostic.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### utility

+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
