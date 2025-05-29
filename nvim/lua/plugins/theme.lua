return {
    {
        "decaycs/decay.nvim",
        name = "decay",
        lazy = false,
        priority = 1000,
        config = function()
            require('decay').setup({
                config = function()
                end
            })
        end
    },
    {
      "vague2k/vague.nvim",
      config = function()
        -- NOTE: you do not need to call setup if you don't want to.
                require("vague").setup({
                  transparent = true, -- don't set background
                  style = {
                    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                    boolean = "none",
                    strings = "none",
                    builtin_types = "bold",
                  },
                    colors = {
                    builtin = "#d95672",
                    property = "#bbbbbd", -- the actual C variables
                    parameter = "#dd8282", -- function calls
                  },
              })
      end
    },
}
