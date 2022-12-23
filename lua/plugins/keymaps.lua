local keymap = vim.keymap.set
local opts = { silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Nvimtree
keymap("n", "<leader>pv", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>fv", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ff", ":NvimTreeFindFile<CR>", opts)

-- Termtoggle 
require("toggleterm").setup {
		open_mapping = [[<c-x>]],
		shade_terminals = false
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Harpoon
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

keymap("n", "<C-h>", function() ui.nav_file(1) end)
keymap("n", "<C-t>", function() ui.nav_file(2) end)
keymap("n", "<C-n>", function() ui.nav_file(3) end)
keymap("n", "<C-s>", function() ui.nav_file(4) end)

-- Tabs
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

keymap("n", "<A-1>", '<Cmd>BufferGoto 1<CR>', opts)
keymap("n", "<A-2>", '<Cmd>BufferGoto 2<CR>', opts)
keymap("n", "<A-3>", '<Cmd>BufferGoto 3<CR>', opts)
keymap("n", "<A-4>", '<Cmd>BufferGoto 4<CR>', opts)
keymap("n", "<A-5>", '<Cmd>BufferGoto 5<CR>', opts)
keymap("n", "<A-6>", '<Cmd>BufferGoto 6<CR>', opts)
keymap("n", "<A-7>", '<Cmd>BufferGoto 7<CR>', opts)
keymap("n", "<A-8>", '<Cmd>BufferGoto 8<CR>', opts)
keymap("n", "<A-9>", '<Cmd>BufferGoto 9<CR>', opts)
keymap("n", "<A-0>", '<Cmd>BufferGotoLast<CR>', opts)

keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
keymap('n', '<A-q>', '<Cmd>BufferClose<CR>', opts)
