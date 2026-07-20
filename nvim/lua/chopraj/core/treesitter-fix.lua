-- WORKAROUND (Neovim 0.12 + archived nvim-treesitter master branch)
--
-- nvim-treesitter is pinned to the `master` branch, which is archived and only
-- supports up to ~Neovim 0.10. On Neovim 0.12 its bundled markdown queries
-- crash the builtin treesitter highlighter:
--   "attempt to call method 'range' (a nil value)"  (languagetree.lua)
--
-- The crash fires whenever `vim.treesitter.start` is called for markdown — which
-- snacks.nvim's `quickfile` and the file-finder *preview* do directly, bypassing
-- nvim-treesitter's own `disable` option. So we intercept at the source and skip
-- treesitter for markdown (Vim's regex syntax highlighting still applies).
--
-- Proper fix: migrate nvim-treesitter to its `main` branch (the 0.11+ rewrite).
local orig_start = vim.treesitter.start
vim.treesitter.start = function(bufnr, lang)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  if lang == "markdown" or lang == "markdown_inline" or ft == "markdown" then
    return
  end
  return orig_start(bufnr, lang)
end
