function ZenMode ()
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
