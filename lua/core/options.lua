-- [[ Options ]] --

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true -- Causes issues with lazy installation

-- Background color
vim.opt.background = "dark"

-- Disable animations
vim.g.snacks_animate = false

-- Diagnostic display
vim.o.signcolumn = "yes"
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})
