local onedarkpro = require("onedarkpro")
local utils = require("onedarkpro.utils")
local nicerBG = "#1e2127"
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {
    onedark = {
      bg = nicerBG
    }
  }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {
           -- SpellBad = { fg = "#8b3434", bg = "#2a252b", style = "italic" },
           -- SpellCap = { fg = "#835d1a", bg = "#292928", style = "italic" },
           -- SpellRare = { fg = "#48b0bd", bg = "#25252b",  style = "italic" },
           -- SpellLocal = { fg = "#7e3992", bg = "#292534", style = "italic" },
           DiagnosticVirtualTextError = { fg = "#8b3434", bg = "#2a252b", style = "italic" },
           DiagnosticVirtualTextWarn = { fg = "#835d1a", bg = "#292928", style = "italic" },
           DiagnosticVirtualTextInfo = { fg = "#48b0bd", bg = "#25252b",  style = "italic" },
           DiagnosticVirtualTextHint = { fg = "#7e3992", bg = "#292534", style = "italic" },
           -- Pmenu = {bg = "#0F1013"},
           -- PmenuSel = {bg = "#334477"},
           Pmenu = {bg = utils.darken(nicerBG, 0.4)},
           PmenuSel = {bg = utils.lighten(nicerBG, 0.8)},
           -- PmenuSbar = {bg = "#00FF00"},
           -- PmenuThumb = {bg = utils.darken(nicerBG, 0.4)},
           NormalFloat = {bg = utils.darken(nicerBG, 0.4)},
  },
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "bold,italic", -- Style that is applied to keywords
      functions = "bold", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocused_color = true, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
