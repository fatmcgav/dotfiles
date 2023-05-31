-- use mason-lspconfig to configure LSP installations
return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "gopls",
      "marksman",
      "jsonls",
      "pyright",
      "terraformls",
      "tflint",
      "yamlls",
    },
  },
}
