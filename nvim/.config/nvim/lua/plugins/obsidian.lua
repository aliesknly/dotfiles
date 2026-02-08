return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  ui = { enable = false },
  enabled = function()
    -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
    return not vim.g.disable_obsidian
  end,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "Personal",
        path = "~/Documents/obsidian/Personal",
      },
      {
        name = "Church",
        path = "~/Documents/obsidian/Church",
      },
      {
        name = "Work",
        path = "~/Documents/obsidian/Work",
      },
    },
    completition = {
      cmp = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
    -- Settings for templates
    note_id_func = function()
      return os.date("%Y%m%d%H%M%S") .. "-" .. vim.fn.printf("%04x", math.random(0, 0xffff))
    end,
    frontmatter = {
      func = function(note)
        local title = note.title or (note.aliases and note.aliases[1]) or note.id
        return {
          id = note.id,
          title = title,
          aliases = title or note.aliases,
          tags = note.tags,
          created = os.date("%Y-%m-%d"),
        }
      end,
    },

    wiki_link_func = function(opts)
      return string.format("[[%s|%s]]", opts.id, opts.title)
    end,

    templates = {
      subdir = "templates", -- Subdirectory for templates
      date_format = "%Y-%m-%d-%a", -- Date format for templates
      gtime_format = "%H:%M", -- Time format for templates
      tags = "", -- Default tags for templates
    },
  },
}
