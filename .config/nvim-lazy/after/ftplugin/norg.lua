local function set_hl(group, values)
	vim.api.nvim_set_hl(0, group, values)
end
set_hl("Headline1", { fg = "#bbc2cf", bg = "#47394e", bold = true, italic = false })
set_hl("Headline2", { fg = "#4ca0da", bg = "#273b4b", bold = false, italic = false })
set_hl("Headline3", { fg = "#a9a1e1", bg = "#373948", bold = false, italic = true })
set_hl("Headline4", { fg = "#96bb64", bg = "#343d32", bold = false, italic = true })
set_hl("Headline5", { fg = "#50a6e0", bg = "#433d36", bold = false, italic = true })
set_hl("Headline6", { fg = "#8a80ab", bg = "#433d36", bold = false, italic = true })
