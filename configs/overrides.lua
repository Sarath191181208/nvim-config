local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- "rust-analyzer",
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "tailwindcss-language-server",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    side = "right",
  },
}

M.copilot = {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-l>",
      prev = "<M-[>",
      next = "<M-]>",
      -- dismiss = "<C-]>",
    },
  },
  panel = {
    enable = false,
  },
}

local function close_nvim_tree()
  local api = require "nvim-tree.api"
  api.tree.close()
end

local function open_nvim_tree()
  local api = require "nvim-tree.api"
  api.tree.open()
end

M.auto_session = {
  auto_session_enable_last_session = true,

  -- make nvim-tree compatable with the auto-session
  log_level = "error",
  pre_save_cmds = { close_nvim_tree },
  post_save_cmds = { open_nvim_tree },
  post_open_cmds = { open_nvim_tree },
  post_restore_cmds = { open_nvim_tree },
  cwd_change_handling = {
    restore_upcoming_session = true,
    pre_cwd_changed_hook = close_nvim_tree,
    post_cwd_changed_hook = open_nvim_tree,
  },

}

return M
