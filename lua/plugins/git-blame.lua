return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>ga", "<cmd>GitBlameToggle<CR>", desc = "Git BlAme" }
  },
  opts = {
    enabled = false,  -- Disable by default
    message_template = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
}
