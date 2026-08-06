-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Relative line numbers in netrw
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    desc = "Enable line numbers in netrw",
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end,
})

-- Open files with "h" or "l" in netrw
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    desc = "Open file with h or l",
    callback = function()
        vim.keymap.set("n", "l", "<CR>", { buffer = true, remap = true })
        vim.keymap.set("n", "h", "<CR>", { buffer = true, remap = true })
    end,
})

-- Create new file with "%" in the main window (netrw default replaces the listing)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    desc = "Create new file with % in the main window",
    callback = function()
        vim.keymap.set("n", "%", function()
            local curdir = vim.b.netrw_curdir or vim.fn.getcwd()
            local name = vim.fn.input("Enter filename: ")
            if name == "" then
                return
            end
            local path = vim.fn.isabsolutepath(name) == 1
                and name
                or vim.fn["netrw#fs#ComposePath"](curdir, name)
            local chgwin = vim.g.netrw_chgwin
            if chgwin and chgwin >= 1 and chgwin <= vim.fn.winnr("$") then
                vim.api.nvim_set_current_win(vim.fn.win_getid(chgwin))
            end
            vim.cmd("keepalt edit " .. vim.fn.fnameescape(path))
            vim.api.nvim_create_autocmd("BufWritePost", {
                buffer = 0,
                once = true,
                callback = function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.bo[buf].filetype == "netrw" and vim.b[buf].netrw_curdir then
                            vim.api.nvim_win_call(win, function()
                                pcall(vim.cmd,
                                    "silent! call netrw#LocalBrowseCheck(" ..
                                    vim.fn.string(vim.b[buf].netrw_curdir) .. ")")
                            end)
                            break
                        end
                    end
                end,
            })
        end, { buffer = true, desc = "Create new file in the main window" })

        -- netrw only maps "%" if hasmapto('<Plug>NetrwOpenFile') is false
        vim.keymap.set("n", "<Plug>(NetrwOpenFileDummy)", "<Plug>NetrwOpenFile", { buffer = true, silent = true })
    end,
})

-- Treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "vim" },
    desc = "Enable treesitter highlighting",
    callback = function()
        vim.treesitter.start()
    end,
})

-- Lsp keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, opts)
        vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<leader>df', function()
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end, opts)
        vim.keymap.set('v', '<leader>df', function()
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end, opts)
    end,
})
vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})
