# Installation
Clone the repository into .config/nvim:
```
git clone https://github.com/nanoesouza/nvim-config/ ~/.config/nvim
```

This will automatically install everything needed for Neovim.

Make sure to delete the folder `~/.local/share/nvim`, if you already have any config for neovim, or it can break our stuff.

# Configurations
This repo is divided into different files, to make it more organized:

`init.lua` - here is our main config file. Neovim will install packer and every plugin trough here. This file will also set some configs, like our colorscheme.
`after` directory - some configs for a few plugins.
`lua` directory - here we have our keymaps and some definitions and other options.

# Extensions
- telescope
- telescope-fzf-native
- impatient
- nvim-treesitter
- playground
- harpoon
- undotree
- vim-fugitive
- nvim-web-devicons
- nvim-tree
- barbar
- bufferline.nvim
- bbye
- toggleterm
- indent-blankline
- auto-save
- lualine

# Keymaps
