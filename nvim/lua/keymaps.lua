vim.g.mapleader = " "

local map = vim.keymap.set

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Netrw
map("n", "<leader>e", "<cmd>Lexplore<cr>", { desc = "Open netrw on the left" })

-- Window navigation
map("n", "<leader>h", "<C-w>h", { desc = "Focus left" })
map("n", "<leader>l", "<C-w>l", { desc = "Focus right" })
map("n", "<leader>j", "<C-w>j", { desc = "Focus down" })
map("n", "<leader>k", "<C-w>k", { desc = "Focus up" })

-- Window splitting
map("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>tv", "<C-w>H", { desc = "Make split vertical" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Fuzzy finder
map("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find files" })
map("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "Live grep" })
map("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "Find buffers" })
