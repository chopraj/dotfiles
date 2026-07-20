vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Option+Backspace to delete word backward in insert mode
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })

-- Toggle comment
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- Close current buffer
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<cr>", { desc = "Close current buffer" })

local function get_root_for_path(path)
    local git_root = vim.fs.root(path, { ".git" })
    if git_root then
        return git_root
    end

    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
        local root_dir = client.config and client.config.root_dir
        if root_dir and root_dir ~= "" then
            return root_dir
        end
    end

    return vim.fs.root(path, { "package.json", "tsconfig.json", "pyproject.toml", "Cargo.toml", "go.mod" })
        or vim.uv.cwd()
end

vim.keymap.set("n", "<leader>cf", function()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        vim.notify("No file path for current buffer", vim.log.levels.INFO)
        return
    end

    local normalized_path = vim.fs.normalize(path)
    local root = get_root_for_path(normalized_path)
    local relative_path = vim.fs.relpath(root, normalized_path) or normalized_path

    vim.fn.setreg('"', relative_path)
    vim.fn.setreg("+", relative_path)
    vim.notify("Copied " .. relative_path)
end, { desc = "Copy file path relative to root" })

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
