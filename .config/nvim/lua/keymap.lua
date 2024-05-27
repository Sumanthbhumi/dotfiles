-- Remap arrow keys in insert mode
vim.api.nvim_set_keymap("i", "<A-l>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-h>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Down>", { noremap = true })

vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true })

-- Navigate to the next buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true })

-- Navigate to the previous buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true })

-- Set scrolloff option
vim.opt.scrolloff = 7
--Swapfile
vim.opt.swapfile = false

vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- Set transparency for NvimTree
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "NONE" })

-- Set transparency for floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.keymap.set("i", "<c-bs>", "<C-W>", { noremap = true, silent = true })
-- vim.keymap.set("c", "<c-bs>", "<C-W>", { noremap = true, silent = true })
