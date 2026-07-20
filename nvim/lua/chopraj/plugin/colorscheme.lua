return {
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup({
        background = {
          dark = "zen",
          light = "pearl",
        },
      })

      vim.cmd("colorscheme kanso-zen")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 900,
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = {
          dark = "wave", -- try "dragon" for darker variant
          light = "lotus"
        },
      })

      -- Available themes:
      -- kanagawa-wave (default dark theme)
      -- kanagawa-dragon (darker variant)
      -- kanagawa-lotus (light theme)

      -- Set kanagawa as the colorscheme
      -- vim.cmd("colorscheme kanagawa-wave")
    end,
  },
  {
    "vague-theme/vague.nvim",
    priority = 900,
    config = function()
      require("vague").setup({})
    end,
  },
}
