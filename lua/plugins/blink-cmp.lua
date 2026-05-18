return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "xzbdmw/colorful-menu.nvim",
  },
  build = "cargo +nightly build --release",
  config = function()
    require("blink.cmp").setup({
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "select_and_accept", "fallback"},
        ["<Esc>"] = { "hide", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            treesitter = { "lsp" },
            columns = {
              -- { "label", "label_description", gap = 2 },
              { "kind_icon", "label", gap = 1 },
              { "kind", "source_name", gap = 2 },
            },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          -- window = {
          --   border = "rounded"
          -- }
        },
        trigger = {
          show_on_trigger_character = true,
          show_on_blocked_trigger_characters = { ' ', '\n', '\t' }
        }
      },
      cmdline = {
        keymap = {
          preset = "super-tab",
          ["<CR>"] = { "select_and_accept", "fallback"},
          ["<Esc>"] = { "hide", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end
}
