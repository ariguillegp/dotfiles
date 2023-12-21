return {
  { -- Add indentation guides even on blank lines
    -- See `:help ibl`
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        indent = { char = "┊" },
      }
    end,
  },
}
