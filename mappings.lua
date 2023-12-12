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

M.telescope = {
  n = {
    ["<C-F>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
  },
}

-- more keybinds!

return M
