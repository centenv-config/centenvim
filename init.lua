----- [[ CentenVim ]] -----
-- CentenV's custom Neovim configuration


-- WARNING: !!!
-- This file contains configurations that are backbone to the customization of Neovim.
-- Parameters that potentially/are subject to be changed are stored in core.options
-- WARNING: !!!


-- [[ Plugin manager - lazy.nvim ]] --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  require("plugins.auto-save"),
  require("plugins.blink-cmp"),
  require("plugins.bufferline"),
  require("plugins.conform"),
  require("plugins.dropbar"),
  require("plugins.git-blame"),
  require("plugins.git-conflict"),
  -- require("plugins.nvim-tree"),
  require("plugins.gitsigns"),
  require("plugins.lualine"),
  require("plugins.mason-tool-installer"),
  require("plugins.nvim-autopairs"),
  require("plugins.nvim-dap"),
  require("plugins.nvim-lint"),
  require("plugins.nvim-lspconfig"),
  require("plugins.nvim-treesitter"),
  require("plugins.nvim-ts-autotag"),
  require("plugins.mason"),
  require("plugins.mini-icons"),
  require("plugins.noice"),
  require("plugins.snacks"),
  require("plugins.telescope"),
  require("plugins.todo-comments"),
  require("plugins.trouble"),
  require("plugins.ts-comments"),
  require("plugins.which-key"),
  -- Themes
  require("plugins.themes.catppuccin"),
  require("plugins.themes.github-nvim-theme"),
  require("plugins.themes.nightfox"),
  require("plugins.themes.onedark"),
  require("plugins.themes.onedarkpro"),
}, { timeout = 300 })


-- [[ Language Configurations ]] --
-- Ensure all LSPs, DAPs, Linters, Formatters are installed
require("mason-tool-installer").setup {
  ensure_installed = require("languages").ensure_installed,
  automatic_installation = true
}
-- Load all language configurations
require("languages").load_languages()
require("languages").load_dap_configs()
require("languages").load_linters()


-- [[ UI Defaults ]] --
-- Load default theme
vim.cmd("colorscheme carbonfox")
-- Load Lualine config
require("core.statusline")


-- [[ Basic Vim Housekeeping ]] --
-- WARNING: As mentioned at the beginning, these are not to be usually tweaked. That is reserved for the core.options file
-- Enable Nerd Fonts
vim.g.have_nerd_font = false
-- Line text behavior (don't split words, disable line wrap by default)
vim.o.linebreak = true
vim.o.wrap = false
-- Enable mouse usage
vim.o.mouse = "a"
-- Use system clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
-- Auto indentation
vim.o.autoindent = true
-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
-- Smart case sensitivity when using search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Persistant history
vim.o.undofile = true
-- Autosave? TODO: wtf is this
vim.o.autowriteall = true
-- Disable ~ in empty lines
vim.opt.fillchars = { eob = " " }
-- Centralized statusline
vim.opt.laststatus = 3
-- TODO: ADD MORE

-- Load custom configurations
require("core.options")
require("core.keymaps")
