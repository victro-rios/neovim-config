local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {}) -- ctrl + p to look for files
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {}) -- space + f + g to look for strings between the files
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {}) -- space + f + h to look for documentation 

