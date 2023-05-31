return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    opts = function(_, opts)
      return require("astronvim.utils").extend_tbl(opts, {
        add_blank_line_top = false,
        hide_root_node = true,
        retain_hidden_root_indent = true,
        source_selector = {
          winbar = false,
        },
        git_status_async = false,
        filesystem = {
          filtered_items = {
            always_show = {
              ".github",
            }
          }
        },
      })
    end,
  },
}
