require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/notes/work",
          home = "~/notes/home",
        }
      }
    },
    ["core.norg.concealer"] = {},
    ["core.presenter"] = {config={ zen_mode="zen-mode"}},
    ["core.norg.qol.toc"] = { config = {default_split_mode = "split"}}
  }
}
