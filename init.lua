----- [[ CentenVim ]] -----
-- CentenV's custom Neovim configuration

-- WARNING: !!!
-- This file contains configurations that are backbone to the customization of Neovim.
-- Parameters that potentially/are subject to be changed are stored in core.options
-- WARNING: !!!

-- [[ Basic Vim Housekeeping ]] --

-- All the below are derived from kickstart.nvim --
-- Make <leader> as <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Enable Nerd Fonts
vim.g.have_nerd_font = true
-- Enable mouse usage
vim.o.mouse = "a"
-- Don't show the mode, it's already in the status line
vim.o.showmode = false
-- Use system clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
-- Enable break indent. When a long line wraps continuation is dumped at col 0
vim.o.breakindent = true
-- Persistant undo/redo history
vim.o.undofile = true
-- Smart case sensitivity when using search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Sign column always shown
vim.o.signcolumn = "yes"
-- Set update time. How long Neovim waits for background actions when completed typing
vim.o.updatetime = 200
-- Set mapped key sequence wait time. How long Neovim waits for the next key before giving up
vim.o.timeoutlen = 300
-- New splits open on the right or bottom
-- TODO: add <leader>H or <leader>V open at left or top
vim.o.splitright = true
vim.o.splitbelow = true
-- Whitespace character indicators
-- TODO: come back
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Show which lines are affected by substitution change
-- WARN: new
vim.o.inccommand = 'split'
-- Show which line your cursor is on
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5
-- Display confirmation if risky command is ran
vim.o.confirm = true
-- End of kickstart.nvim --

-- Line text behavior (don't split words, disable line wrap by default)
vim.o.linebreak = true
vim.o.wrap = false
-- Auto indentation
vim.o.autoindent = true
-- Tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
-- Autosave? TODO: wtf is this
vim.o.autowriteall = true
-- Disable ~ in empty lines
vim.opt.fillchars = { eob = " " }
-- Centralized statusline
vim.opt.laststatus = 3

vim.o.winborder = "rounded"


-- HACK: Hide line numbers in lazy.nvim window
vim.api.nvim_create_autocmd("FileType",{
  pattern = "lazy",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
});


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
require("lazy").setup(
  {
    require("plugins.auto-save"),
    require("plugins.blink-cmp"),
    require("plugins.bufferline"),
    require("plugins.conform"),
    require("plugins.dropbar"),
    require("plugins.git-blame"),
    require("plugins.git-conflict"),
    -- require("plugins.nvim-tree"),
    require("plugins.gitsigns"),
    require("plugins.guess-indent"),
    require("plugins.lualine"),
    require("plugins.markview"),
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
    -- Language-specific plugins
    require("plugins.langspec.nvim-java");
    -- Themes
    require("plugins.themes.catppuccin"),
    require("plugins.themes.github-nvim-theme"),
    require("plugins.themes.nightfox"),
    require("plugins.themes.onedark"),
    require("plugins.themes.onedarkpro"),
  },
  {
    timeout = 300,
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      }
    }
  }
)


-- [[ Language Configurations ]] --
-- Ensure all LSPs, DAPs, Linters, Formatters are installed
require("mason-tool-installer").setup {
  ensure_installed = require("languages").ensure_installed,
  automatic_installation = true
}
-- Load all language configurations
require("languages").load_languages()
require("languages").load_dap_configs()
-- require("languages").load_linters()


-- [[ UI Defaults ]] --
-- Load default theme
vim.cmd("colorscheme carbonfox")
-- Load Lualine config
require("core.statusline")


-- TODO: ADD MORE




-- Load custom configurations
require("core.options")
require("core.keymaps")
