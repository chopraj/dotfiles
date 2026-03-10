vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Leader-based editing shortcuts under <leader>c to avoid terminal/super-key issues.
vim.keymap.set("n", "<leader>cz", "u", { desc = "Undo" })
vim.keymap.set("i", "<leader>cz", "<C-o>u", { desc = "Undo" })

vim.keymap.set("n", "<leader>cZ", "<cmd>redo<cr>", { desc = "Redo" })
vim.keymap.set("i", "<leader>cZ", "<C-o><cmd>redo<cr>", { desc = "Redo" })

vim.keymap.set("n", "<leader>cs", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<leader>cs", "<C-o><cmd>w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>ca", "ggVG", { desc = "Select all" })
vim.keymap.set("i", "<leader>ca", "<Esc>ggVG", { desc = "Select all" })

vim.keymap.set("v", "<leader>cc", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>cc", '"+yy', { desc = "Copy line to clipboard" })

vim.keymap.set("n", "<leader>cv", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>cv", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<leader>cv", "<C-r>+", { desc = "Paste from clipboard" })

vim.keymap.set("v", "<leader>cx", '"+x', { desc = "Cut to clipboard" })
vim.keymap.set("n", "<leader>cx", '"+dd', { desc = "Cut line to clipboard" })

-- Option+Backspace to delete word backward in insert mode
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })

-- Toggle comment
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- Close current buffer
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<cr>", { desc = "Close current buffer" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Auto-refresh buffers when files change externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    desc = "Check for file changes and reload buffer",
    group = vim.api.nvim_create_augroup("auto-checktime", { clear = true }),
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})
