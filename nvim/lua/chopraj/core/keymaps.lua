local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Cmd+Z for undo
vim.keymap.set("n", "<D-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<D-z>", "<C-o>u", { desc = "Undo" })

-- Cmd+Shift+Z for redo
vim.keymap.set("n", "<D-S-z>", "<cmd>redo<cr>", { desc = "Redo" })
vim.keymap.set("i", "<D-S-z>", "<C-o><cmd>redo<cr>", { desc = "Redo" })

-- Cmd+S for save
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<C-o><cmd>w<cr>", { desc = "Save file" })

-- Cmd+A for select all
vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("i", "<D-a>", "<C-o>ggVG", { desc = "Select all" })

-- Clipboard shortcuts
-- Cmd+C for copy
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<D-c>", '"+yy', { desc = "Copy line to clipboard" })

-- Cmd+V for paste
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("i", "<D-v>", "<C-r>+", { desc = "Paste from clipboard" })

-- Cmd+X for cut
vim.keymap.set("v", "<D-x>", '"+x', { desc = "Cut to clipboard" })
vim.keymap.set("n", "<D-x>", '"+dd', { desc = "Cut line to clipboard" })

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
