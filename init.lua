-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.wo.relativenumber = true
vim.o.wrap = false;
-- vim.o.shell = vim.fn.executable('pwsh') and 'pwsh' or 'powershell'
-- vim.g.copilot_assume_mapped = true
