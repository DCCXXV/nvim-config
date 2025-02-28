vim.g.mapleader = " "
vim.keymap.set("n", "<leader>tt", vim.cmd.Ex)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- adoc_pdf_live
vim.keymap.set("n", "<leader>ap", vim.cmd.AdocPdfLiveOpen)

-- centerpad

vim.keymap.set("n", "<leader>ee", zen_mode)
