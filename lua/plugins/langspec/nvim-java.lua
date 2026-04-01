return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup()
    vim.lsp.enable('jdtls')
  end,
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      opts = {
        servers = {
          jdtls = {
            -- custom jdtls settings here
          },
        },
        setup = {
          jdtls = function()
            require('java').setup({
              -- custom nvim-java config here
            })
          end,
        },
      },
    }
  }
}
