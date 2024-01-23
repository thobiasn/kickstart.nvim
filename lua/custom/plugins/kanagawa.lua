return {
  { 'rebelot/kanagawa.nvim',
    config = function ()
      require('kanagawa').setup({
        transparent = true
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa"
    }
  }
}
