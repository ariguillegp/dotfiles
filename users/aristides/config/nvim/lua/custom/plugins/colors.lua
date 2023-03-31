return {
   -- Fancy color scheme
  'folke/tokyonight.nvim',

  config = function()
    -- Set options for color scheme
    -- Needs to be set before enabling the color plugin
    require("tokyonight").setup({
      style = "night",
      transparent = false,
    })
  end,
}
