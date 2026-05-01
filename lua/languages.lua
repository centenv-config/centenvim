-- [[ Language Components ]] --
-- Names via nvim-lspconfig
local M = {}

-- All LSPs, DAPs, Linters, Formatters to be installed by Mason
M.ensure_installed = {
  -- LSPs
  -- "bashls",
  -- "biome",
  -- "clangd",
  -- "cssls",
  -- "css_variables",
  -- "docker_compose_language_service",
  -- "dockerls",
  -- "eslint",
  -- "gh_actions_ls",
  -- "gitlab_ci_ls",
  -- "gopls",
  -- "jdtls",
  -- "jsonls",
  -- "lua_ls",
  -- "marksman",
  -- "pyright",
  -- "postgres_lsp",
  -- "prismals",
  -- "rust_analyzer",
  -- "tailwindcss",
  -- "ts_ls",
  -- "yamlls",
  -- DAPs (TODO: Add)
  -- Linters
  -- "biome",
  -- "eslint_d"
  -- Formatters
  -- "prettier"
}

-- LSPs --
function M.load_languages()
  local dapui = require("dapui")
  dapui.setup()

  -- Enable all Mason identifiers
  for _, lsp_identifier in ipairs(M.ensure_installed) do
    vim.lsp.enable(lsp_identifier)
  end
end


-- DAPs --
M.ensure_installed_dap = {
  "codelldb",
  "cppdbg",
  "javadbg",
  "python",
}

M.dap_lang_plugins = {
  { "mfussenegger/nvim-dap-python" },
}

function M.load_dap_configs()
  require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
end


-- Linters --
-- Reference: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
-- function M.load_linters()
--   require("lint").linters_by_ft = {
--     javascript = { "biomejs" },
--     javascriptreact = { "biomejs" },
--     typescript = { "biomejs" },
--     typescriptreact = { "biomejs" },
--   }
-- end
--
--
-- -- Formatters --
-- function M.load_formatters()
--   require("conform").setup({
--     formatters_by_ft = {
--       javascript = { "prettier", "biome" },
--       -- javascriptreact = { "prettier" },
--       typescript = { "prettier", "biome" },
--       -- typescriptreact = { "prettier" },
--     }
--   })
-- end



return M
