-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Resume telescope
keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume last Telescope picker" }
)

-- Do things without affecting the registers
keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete without affecting register" })
keymap.set("n", "<Leader>p", '"0p', { noremap = true, silent = true, desc = "Paste from yank register" })
keymap.set("n", "<Leader>P", '"0P', { noremap = true, silent = true, desc = "Paste before from yank register" })
keymap.set("v", "<Leader>p", '"0p', { noremap = true, silent = true, desc = "Paste over selection from yank register" })
keymap.set("n", "<Leader>c", '"_c', { noremap = true, silent = true, desc = "Change without affecting register" })
keymap.set(
  "n",
  "<Leader>C",
  '"_C',
  { noremap = true, silent = true, desc = "Change to end of line without affecting register" }
)
keymap.set(
  "v",
  "<Leader>c",
  '"_c',
  { noremap = true, silent = true, desc = "Change selection without affecting register" }
)
keymap.set(
  "v",
  "<Leader>C",
  '"_C',
  { noremap = true, silent = true, desc = "Change selection to end of line without affecting register" }
)
keymap.set("n", "<Leader>d", '"_d', { noremap = true, silent = true, desc = "Delete without affecting register" })
keymap.set(
  "n",
  "<Leader>D",
  '"_D',
  { noremap = true, silent = true, desc = "Delete to end of line without affecting register" }
)
keymap.set(
  "v",
  "<Leader>d",
  '"_d',
  { noremap = true, silent = true, desc = "Delete selection without affecting register" }
)
keymap.set(
  "v",
  "<Leader>D",
  '"_D',
  { noremap = true, silent = true, desc = "Delete selection to end of line without affecting register" }
)
keymap.set(
  "n",
  "<Leader>dd",
  '"_dd',
  { noremap = true, silent = true, desc = "Delete line without affecting register" }
)
keymap.set(
  "n",
  "<Leader>DD",
  '"_DD',
  { noremap = true, silent = true, desc = "Delete entire line without affecting register" }
)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { noremap = true, silent = true, desc = "Delete word backwards" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { noremap = true, silent = true, desc = "Select all text" })

-- New tab
keymap.set("n", "te", ":tabedit<CR>", { noremap = true, silent = true, desc = "Open new tab" })
keymap.set("n", "<tab>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
keymap.set("n", "<s-tab>", ":tabprev<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })

-- Split window
keymap.set("n", "sh", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })
keymap.set("n", "sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split window vertically" })

-- Move focus between windows
keymap.set("n", "sh", "<C-w>h", { noremap = true, silent = true, desc = "Move focus to left window" })
keymap.set("n", "sk", "<C-w>k", { noremap = true, silent = true, desc = "Move focus to upper window" })
keymap.set("n", "sj", "<C-w>j", { noremap = true, silent = true, desc = "Move focus to lower window" })
keymap.set("n", "sl", "<C-w>l", { noremap = true, silent = true, desc = "Move focus to right window" })

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", { noremap = true, silent = true, desc = "Decrease window width" })
keymap.set("n", "<C-w><right>", "<C-w>>", { noremap = true, silent = true, desc = "Increase window width" })
keymap.set("n", "<C-w><up>", "<C-w>+", { noremap = true, silent = true, desc = "Increase window height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { noremap = true, silent = true, desc = "Decrease window height" })

-- Toggle spelling
keymap.set("n", "<leader>ts", function()
  if vim.opt.spell:get() then
    vim.opt.spell = false
    print("Spell checking disabled")
  else
    vim.opt.spelllang = "en_us"
    vim.opt.spell = true
    print("Spell checking enabled")
  end
end, { noremap = true, silent = true, desc = "Toggle spelling" })

-- Toggle line wrapping
keymap.set("n", "<leader>wr", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  print("Line wrap: " .. (vim.opt.wrap:get() and "on" or "off"))
end, { noremap = true, silent = true, desc = "Toggle line wrap" })
