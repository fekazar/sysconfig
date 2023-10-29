return { 
  "ellisonleao/gruvbox.nvim", 
  priority = 1000 , 
  -- config = true, 
  config = function()
    vim.cmd([[colorscheme gruvbox]])
  end,
  opts = ...
}
