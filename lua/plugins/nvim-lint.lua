return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  config = function()
    require("languages").load_linters()
    vim.api.nvim_create_autocmd(
      { "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" },
      {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end
      }
    )
  end
}
