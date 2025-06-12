return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- Enable for all file types
    }, {
      names = false, -- Don't highlight color names like "red"
      tailwind = true,
      mode = "background",
    })
  end
}

