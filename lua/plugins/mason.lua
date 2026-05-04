return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        -- Needed for .NET development
        "github:Crashdummyy/mason-registry",
      }
    })
  end,
  opts = {}
}
