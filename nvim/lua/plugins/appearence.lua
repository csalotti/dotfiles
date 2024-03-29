return {
  {
    -- Theme
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd.colorscheme 'carbonfox'
    end,
    opts = {
      options = {
        colorblind = {
          enable = true,         -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0,          -- Severity [0,1] for protan (red)
            deutan = 1,          -- Severity [0,1] for deutan (green)
            tritan = 0,          -- Severity [0,1] for tritan (blue)
          }
        }
      }
    }
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
