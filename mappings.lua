---@type MappingsTable
local M = {}
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>d"] = { '"_d', "delete without yanking" },
    ["<leader>p"] = { '[["_dP]]', "paste the text whithout copying " },
  },
  i = {
    -- making ctrl+backspace = ctrl+w
    ["<C-h>"] = { "<C-w>", "Delete a word" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<C-F>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}

-- require("gitsigns")

-- more keybinds!
M.gitsigns = {
  n = {
    ["<leader>gsh"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
    ["<leader>gus"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk" },
    ["<leader>gub"] = { "<cmd> Gitsigns reset_buffer <CR>", "Undo stage buffer" },
  },
}

return M
