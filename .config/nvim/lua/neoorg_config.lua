require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/work",
                    home = "~/Documents/home",
                }
            }
        },
        ["core.norg.concealer"] = {},
      }
}
