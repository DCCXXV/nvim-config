require("dccxxv")

require("pam").manage({
    { source = "mvllow/pam.nvim" },
    {
        source = "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            require("rose-pine")
        end,
    },
    {
        source = "nvim-treesitter/nvim-treesitter",
        post_checkout = function()
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup()
        end
    },
    {
        source = "ThePrimeagen/harpoon",
        as = "baboon",
        branch = "harpoon2",
        dependencies = {
            { source = "nvim-lua/plenary.nvim" }
        }
    },
    {
        source = "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { source = "nvim-lua/plenary.nvim" }
        }
    },
    {
        source = "nvim-tree/nvim-web-devicons"
    },
    {
	    source = "goolord/alpha-nvim",
	    config = function()
            local startify = require("alpha.themes.startify")
            startify.file_icons.provider = "devicons"
            require("alpha").setup(startify.config)
        end,
    },
    {
        source = "nvim-lualine/lualine.nvim",
    },
    { source = "hrsh7th/nvim-cmp" },
    { source = "hrsh7th/cmp-nvim-lsp" },
    { source = "hrsh7th/cmp-buffer" },
    { source = "hrsh7th/cmp-path" },
    { source = "hrsh7th/cmp-cmdline" },
    { source = "L3MON4D3/LuaSnip" },
    { source = "hrsh7th/cmp-nvim-lua" },
    { source = "williamboman/mason.nvim" },
    { source = "williamboman/mason-lspconfig.nvim" },
    {
        source = "neovim/nvim-lspconfig",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "gopls", "lua_ls", "clangd" }
            })

            local nvim_lsp = require("lspconfig")
            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            nvim_lsp.pyright.setup({ on_attach = on_attach })
            nvim_lsp.gopls.setup({ on_attach = on_attach })
            nvim_lsp.lua_ls.setup({ on_attach = on_attach })
            nvim_lsp.clangd.setup({ on_attach = on_attach })
    	end,
    },
    {
        source = "m4xshen/autoclose.nvim",
        config = function ()
            require("autoclose").setup()
        end
    },
    { source = "smithbm2316/centerpad.nvim" },
    { source = "OXY2DEV/markview.nvim" },
    {
        source = "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require("ibl").setup()
        end
    },
    {
        source = "marioortizmanero/adoc-pdf-live.nvim",
        config = function ()
            require('adoc_pdf_live').setup()
        end
    },
    { source = "numToStr/FTerm.nvim" },
})

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end,
    ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

require("lualine").get_config()
require("lualine").setup()

vim.cmd("colorscheme rose-pine")
