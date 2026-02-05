-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local wk = require("which-key")
-- Translate plugin
local pantran = require("pantran")

--- Oil file ------
map("n", "<leader>E", "<CMD>Oil --float<CR>", { desc = "Open Oil (floating)" })
map("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil" })

----- OBSIDIAN -----
wk.add({
  -- Main group Obsidian
  { "<leader>o", group = "Obsidian", icon = "󱞁" },

  -- Notes and File Actions
  { "<leader>on", "<cmd>Obsidian new<CR>", desc = "New Note", icon = "󰎚" },
  { "<leader>oo", "<cmd>Obsidian<CR>", desc = "Options", icon = "⚙️" },
  { "<leader>or", "<cmd>Obsidian rename<CR>", desc = "Rename File", icon = "󰏫" },
  { "<leader>oa", "<cmd>Obsidian open<CR>", desc = "Open in Obsidian App", icon = "󱓧" },
  { "<leader>ow", "<cmd>Obsidian workspace<CR>", desc = "Workspaces", icon = "󱂬" },

  -- Navigation and Search
  { "<leader>os", "<cmd>Obsidian search<CR>", desc = "Search Obsidian", icon = "" },
  { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "Quick Switch", icon = "󱊑" },
  { "<leader>of", "<cmd>Obsidian follow_link<CR>", desc = "Follow/Create Link", icon = "󰌹" },

  -- Structure and Content
  { "<leader>oc", "<cmd>Obsidian check<CR>", desc = "Check Checkbox", icon = "󰄲" },
  { "<leader>ot", "<cmd>Obsidian template<CR>", desc = "Insert Template", icon = "󰧮" },
  { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Show Backlinks", icon = "󰌷" },
  { "<leader>ol", "<cmd>Obsidian links<CR>", desc = "Show Links", icon = "󰌹" },
})

--- Translate ---
wk.add({
  { "<leader>t", group = "Translate", icon = "󰗊 " },
  {
    "<leader>tr",
    function()
      return pantran.motion_translate()
    end,
    desc = "Translate motion",
    expr = true,
    icon = "󰗊 ",
  },
  { "<leader>tt", "<cmd>Pantran<cr>", desc = "Interactive Translate", icon = "󱗗 " },
})

wk.add({
  {
    mode = { "v" },
    { "<leader>t", group = "Translate", icon = "󰗊 " },
    { "<leader>tr", ":Pantran<cr>", desc = "Translate selection", icon = "󰗊 " },
  },
})
