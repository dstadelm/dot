require("neotest").setup({
    icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✖",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✔",
      running = "🗘",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "ﰸ",
      unknown = "?"
    },
  adapters = {
    require("neotest-python")({
    }),
  },
})
