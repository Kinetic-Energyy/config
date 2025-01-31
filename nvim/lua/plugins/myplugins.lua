return {
  -- Vim-Be-Good (lazy-loaded with command trigger)
  {
    "ThePrimeagen/vim-be-good",
    lazy = true, -- Lazy load the plugin
    cmd = "VimBeGood", -- Trigger with :VimBeGood command
  },

  -- Better Escape plugin (for jk mapping in insert mode)
  {
    "nvim-zh/better-escape.vim", -- Correct inclusion without `require`
    config = function()
      -- Configure the plugin using Vim global variables (vim.g)
      vim.g.better_escape_interval = 200 -- Set time interval to 200 ms
      vim.g.better_escape_shortcut = { "jk", "kj" } -- Support multiple shortcuts
    end,
  },

  -- Session management with nvim-possession and FZF-Lua dependency
  {
    "gennaro-tedesco/nvim-possession",
    dependencies = { "ibhagwan/fzf-lua" },
    config = function()
      require("nvim-possession").setup({
        -- Add any specific configurations for nvim-possession here
        autosave = true, -- Optional: enable autosave of sessions
        silent = false, -- Optional: suppress messages on session load/save
      })

      -- Key mappings for session management
      local possession = require("nvim-possession")
      vim.keymap.set("n", "<leader>gl", possession.list, { desc = "List Sessions" })
      vim.keymap.set("n", "<leader>gn", possession.new, { desc = "New Session" })
      vim.keymap.set("n", "<leader>gu", possession.update, { desc = "Update Session" })
      vim.keymap.set("n", "<leader>gd", possession.delete, { desc = "Delete Session" })
    end,
  },

  -- Comment.nvim for commenting code with custom keybindings
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
        mappings = {
          basic = true,
          extra = true,
        },
      })
    end,
  },

  -- Code Runner plugin for running code
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        -- Add any specific configurations here, if needed
      })
    end,
  },

  
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- Use 'moon' variant
      })
      vim.cmd("colorscheme rose-pine") -- Set the colorscheme to Rosé Pine
    end,
  },
  { "ThePrimeagen/harpoon" },
  { "nvim-lua/plenary.nvim" },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>[",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme visual_studio_code]])
    end,
  },
  
  
require("lazy").setup({
  {
    'vidocqh/auto-indent.nvim',
    opts = {
      lightmode = true,          -- Keeps indent settings stable within the buffer's lifetime
      indentexpr = function(lnum)
        return require("nvim-treesitter.indent").get_indent(lnum)  -- Custom Treesitter-based indentation
      end,
      ignore_filetype = { 'javascript' },  -- Example of ignoring specific file types
    },
  },
}),



  
  
  
  
  

}
