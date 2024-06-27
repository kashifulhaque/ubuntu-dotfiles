return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Treesitter config
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "awk", "bash", "c", "cpp", "css", "csv", "dockerfile", "lua", "vim", "vimdoc", "go", "java", "javascript", "jsdoc", "json", "html", "nix", "python", "rust", "sql", "svelte", "tsv", "typescript", "typst", "vue", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
