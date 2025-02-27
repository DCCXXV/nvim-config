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
local zenMode = function ()
    -- center code
    vim.cmd("Centerpad")

    -- no numbers
    vim.opt.number = not vim.opt.number:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()

    -- no tildes on the sides
    local current_fillchars = vim.opt.fillchars:get()
    if current_fillchars.eob == " " then
        vim.opt.fillchars:append({ eob = "~"})
    else
        vim.opt.fillchars:append({ eob = " "})
    end

    -- remove lines
    if vim.opt.fillchars:get().stl == " " then
        vim.opt.fillchars:append({ vert = "│" })
    else
        vim.opt.fillchars:append({ vert = " " })
    end

    -- no status bar
    if vim.opt.laststatus:get() == 0 then
        vim.opt.laststatus = 2
    else
        vim.opt.laststatus = 0
    end

    -- no ruler
    if vim.opt.ruler:get() then
        vim.opt.ruler = false
    else
        vim.opt.ruler = true
    end

    vim.opt.showcmd = not vim.opt.showcmd:get()
end

vim.keymap.set("n", "<leader>ee", zenMode)
