return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- Modified version of catppuccin mocha
    require("catppuccin").setup({
      color_overrides = {
        mocha = {
          base = "#181818",
          crust = "#181818",
          mantle = "#181818",
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
