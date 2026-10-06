local utils = require("almagest.utils")

utils.cfgplugin("mason", {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
})
