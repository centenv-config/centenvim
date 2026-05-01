-- [[ Keymaps ]] --
require("util")

local keymap = vim.keymap

-- <leader>
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local options = {
  noremap = true,
  silent = true,
}

-- Basic Vim
-- exit shortcut
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", keymap_opt("Quit", options))
-- disable copying to clipboard on delete
keymap.set({ "n", "v" }, "d", '"_d', options)
-- disable copying to clipboard on substitute
keymap.set("v", "s", '"_s', options)
-- disable copying to clipboard on paste
keymap.set("v", "p", '"_dP')

-- Buffer Management
-- list of buffers
-- navigation
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", keymap_opt("Previous Buffer", options))
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", keymap_opt("Next Buffer", options))
-- close
keymap.set("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, keymap_opt("Close Buffer", options))
-- reorder
keymap.set("n", "<leader>b<Left>", "<cmd>BufferLineMovePrev<CR>", keymap_opt("Move Buffer Left", options))
keymap.set("n", "<leader>b<Right>", "<cmd>BufferLineMoveNext<CR>", keymap_opt("Move Buffer Left", options))

-- Window Management
-- navigation
keymap.set("n", "<C-h>", "<C-w>h", keymap_opt("Move to Left Window", options))
keymap.set("n", "<C-j>", "<C-w>j", keymap_opt("Move to Bottom Window", options))
keymap.set("n", "<C-k>", "<C-w>k", keymap_opt("Move to Top Window", options))
keymap.set("n", "<C-l>", "<C-w>l", keymap_opt("Move to Right Window", options))
-- resize
keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { desc = "Increase Window Height" })
keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { desc = "Decrease Window Height" })
keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })
-- open
keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split Window Horizontally" })
keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split Window Vertically" })
-- close
keymap.set("n", "<leader>wd", "<C-w>q", keymap_opt("Close Window", options))
keymap.set("n", "<leader>w=", "<C-w>=", keymap_opt("Reset Window(s)", options))

-- File explorer
keymap.set(
  { "n", "v" },
  "<leader>e",
  -- "<cmd> Neotree filesystem toggle right <CR>"
  function()
    require("snacks").picker.explorer()
  end,
  keymap_opt("File Explorer", options)
)

-- Search
-- files
keymap.set("n", "<leader><leader>", function()
  require("snacks").picker.files({
    hidden = true,
    ignored = true,
  })
end, keymap_opt("Open File", options))
-- grep
keymap.set("n", "<leader>/", function()
  require("snacks").picker.grep()
end, keymap_opt("Grep in Files", options))
-- keybinds
keymap.set("n", "<leader>sk", function()
  require("snacks").picker.keymaps()
end, keymap_opt("Keymaps", options))

-- Git
keymap.set("n", "<leader>gd", function() require("snacks").picker.git_diff() end, keymap_opt("Git Diff", options))
keymap.set("n", "<leader>gs", function() require("snacks").picker.git_status() end, keymap_opt("Git Status", options))
keymap.set("n", "<leader>gb", function() require("snacks").picker.git_branches() end, keymap_opt("Git Branch", options))
keymap.set("n", "<leader>gf", function() require("snacks").picker.git_grep() end, keymap_opt("Git Find/Lookup", options))
keymap.set("n", "<leader>gr", function() require("snacks").lazygit.log() end, keymap_opt("Git Reflog", options))
keymap.set("n", "<leader>gl", function() require("snacks").picker.git_log() end, keymap_opt("Git Log", options))
keymap.set("n", "<leader>gg", function() require("snacks").lazygit() end, keymap_opt("Git (Lazygit)", options))

-- UI
-- theme management
keymap.set("n", "<leader>ut", "<cmd> Telescope colorscheme <CR>", keymap_opt("Theme", options))
-- notification history
keymap.set("n", "<leader>me", "<cmd> messages <CR>", keymap_opt("Notification history", options))
-- disable F1 for help
keymap.set("i", "<F1>", "", keymap_opt("Empty/Unbound", options))

-- Lazy
keymap.set("n", "<leader>la", "<cmd> Lazy <CR>", keymap_opt("Lazy", options))

-- LSPs, DAPs, Formatters, Linters
keymap.set("n", "<leader>ma", "<cmd> Mason <CR>", keymap_opt("Mason", options))
-- give definition info
keymap.set("n", "<C-Space>", vim.lsp.buf.hover, options)
-- go to's
keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opt("Go to Definition", options))
keymap.set("n", "gr", vim.lsp.buf.references, keymap_opt("Go to References", options))
-- refactor/rename
keymap.set({"n", "i"}, "<F2>", vim.lsp.buf.rename, keymap_opt("Rename", options))
-- format
keymap.set("n", "<leader>f", vim.lsp.buf.format, keymap_opt("Run Formatter on Buffer", options))
-- debugger
keymap.set("n", "<F5>", require("dap").continue, keymap_opt("Debug - Start Debugging/Continue", options))
keymap.set("n", "<S-F5>", require("dap").stop, keymap_opt("Debug - Stop", options))
keymap.set("n", "<F6>", require("dap").step_back, keymap_opt("Debug - Step Back", options))
keymap.set({"n", "i"}, "<F9>", require("dap").toggle_breakpoint, keymap_opt("Debug - Toggle Breakpoint", options))
keymap.set("n", "<F10>", require("dap").step_over, keymap_opt("Debug - Step Over", options))
keymap.set("n", "<F11>", require("dap").step_into, keymap_opt("Debug - Step Into", options))
keymap.set("n", "<S-F11>", require("dap").step_out, keymap_opt("Debug - Step Into", options))
keymap.set("n", "<leader>ud", require("dapui").toggle, keymap_opt("Toggle debug view", options))

-- Coding
-- command palette
keymap.set("n", "<leader>P", function() require("snacks").picker.commands() end, keymap_opt("Command Palette", options))
-- keymap.set("n", "<leader>")
-- line numbers
keymap.set("n", "<leader>ul", function()
  if vim.o.relativenumber then
    vim.o.number = true
    vim.o.relativenumber = false
  else
    vim.o.number = false
    vim.o.relativenumber = true
  end
end, keymap_opt("Toggle Line Number Mode", options))
-- move line up/down
keymap.set({ "n", "i" }, "<M-j>", "<cmd> m +1 <CR>", options)
keymap.set({ "n", "i" }, "<M-k>", "<cmd> m -2 <CR>", options)
