return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
      -- OR use the below line if you prefer devicons
      -- "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" })
    end
  }
}

