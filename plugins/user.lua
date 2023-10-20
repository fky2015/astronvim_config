return {
  {
    "goolord/alpha-nvim",
    cmd = "Alpha",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local opts = require("alpha.themes.startify").opts
      -- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1924014
      opts.layout[2].val = {
        "            :h-                                  Nhy`               ",
        "           -mh.                           h.    `Ndho               ",
        "           hmh+                          oNm.   oNdhh               ",
        "          `Nmhd`                        /NNmd  /NNhhd               ",
        "          -NNhhy                      `hMNmmm`+NNdhhh               ",
        "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
        "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
        "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
        "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
        " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
        " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
        " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
        " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
        "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
        "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
        "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
        "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
        "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
        "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
        "       //+++//++++++////+++///::--                 .::::-------::   ",
        "       :/++++///////////++++//////.                -:/:----::../-   ",
        "       -/++++//++///+//////////////               .::::---:::-.+`   ",
        "       `////////////////////////////:.            --::-----...-/    ",
        "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
        "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
        "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
        "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
        "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
        "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
        "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
        "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
        "                        .-:mNdhh:.......--::::-`                    ",
        "                           yNh/..------..`                          ",
        "                                                                    ",
      }
      require("alpha").setup(opts)
    end,
  },
  {
    "stevearc/qf_helper.nvim",
    cmd = { "QFToggle", "LLToggle" },
    config = function() require("qf_helper").setup() end,
  },
  {
    "numToStr/FTerm.nvim",
    opts = {
      dimensions = {
        height = 0.9, -- Height of the terminal window
        width = 0.9, -- Width of the terminal window
      },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    event = { "CursorHold", "CursorHoldI" },
    opts = {
      autocmd = { enabled = true },
      number = {
        enabled = true,
      },
      sign = {
        enabled = false,
      },
    },
    config = function(opts)
      require("nvim-lightbulb").setup(opts)
      vim.cmd [[highlight LightBulbNumber guifg=#FFce0e]]
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require "ccc"

      ccc.setup {
        -- Your preferred settings
        -- Example: enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        disable_default_mappings = true,
      }
    end,
  },
  { "tpope/vim-fugitive", lazy = false },

  -- this plugin will be loaded when using `:ZenMode`
  { "folke/zen-mode.nvim" },
  { "tpope/vim-unimpaired", lazy = false },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "prochri/telescope-all-recent.nvim",
      dependencies = { "kkharji/sqlite.lua" },
      config = function() require("telescope-all-recent").setup {} end,
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
      { "<leader>j", "<CMD>TSJSplit<CR>", desc = "Treesitter Split" },
      { "<leader>J", "<CMD>TSJJoin<CR>", desc = "Treesitter Join" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.keybinds"] = {}, -- Adds default keybindings
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          }, -- Enables support for completion plugins
          ["core.journal"] = {}, -- Enables support for the journal module
          ["core.highlights"] = {},
        },
      }
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
}
