return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Ctrl + n to show the file tree using neo-tree
    vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>", {})
  end
}
