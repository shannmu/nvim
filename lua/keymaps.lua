--- Use to air-line navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })

--- Use to open source tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

--- Use to file-name search & file-content search
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { silent = true }) -- 在 Git 项目中搜索文件
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { silent = true }) -- 搜索 Git 提交

-- Use to open neogit
vim.keymap.set('n', '<leader>git', ':Neogit<CR>',{ noremap = true, silent = true })
