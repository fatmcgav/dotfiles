return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    ensure_installed = {
      "go",
      "gomod",
      "lua",
      "python",
      "json",
      "make",
      "terraform",
      "yaml",
    },
  },
  dependencies = {
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            -- disable = { "jsx", "cpp" },
            -- Which query to use for finding delimiters
            query = "rainbow-parens",
            -- Highlight the entire buffer all at once
            strategy = require "ts-rainbow.strategy.global",
          },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
          callback = function()
            vim.cmd "TSDisable rainbow"
            vim.cmd "TSEnable rainbow"
          end,
        })
      end,
    },
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
      },
    },
  }
}

