-- Config related to edition such as tab, indentation
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- "Marks" to navigate efficiently
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup({})
      -- REQUIRED
      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<leader>kl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "Open harpoon window" })
      vim.keymap.set("n", "<leader>ka", function() harpoon:list():append() end,
        { desc = "Add to harpoon list" })
      vim.keymap.set("n", "<leader>k1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>k2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>k3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>k4", function() harpoon:list():select(4) end)
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>kp", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<leader>kn", function() harpoon:list():next() end)
    end
  },
}
