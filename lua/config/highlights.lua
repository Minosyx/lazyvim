local function set_highlights_blink()
    local hl = vim.api.nvim_set_hl

    hl(0, "PmenuSel", { bg = "#363636", fg = "NONE" })
    -- hl(0, "PmenuSel", { bg = "#9C9C9C", fg = "NONE" })
    -- hl(0, "Pmenu", { fg = "#9C9C9C", bg = "NONE" })
    hl(0, "Pmenu", { bg = "NONE" })

    hl(0, "BlinkCmpLabelDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    -- hl(0, "BlinkCmpLabelMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    hl(0, "BlinkCmpLabelMatch", { fg = "NONE", bg = "NONE", bold = true })
    hl(0, "BlinkCmpLabel", { fg = "#DADADA", bg = "NONE" })
    hl(0, "BlinkCmpLabelDetail", { fg = "#C792EA", bg = "NONE", italic = true })

    -- Kind Highlights (Tokyo Night Inspired)
    local blue = "#7aa2f7" -- Functions, Methods
    local cyan = "#0db9d7" -- Files, Folders, Operators
    local blue1 = "#2ac3de"
    local blue5 = "#89ddff"
    local magenta = "#bb9af7" -- Keywords
    local magenta2 = "#ff007c" -- Maybe Event? or Type Params?
    local red = "#f7768e" -- Events, Type Params
    local orange = "#ff9e64" -- Constants, Values
    local yellow = "#e0af68" -- Classes, Interfaces, Types
    local green = "#9ece6a" -- Text, Snippets, Copilot
    local green1 = "#73daca" -- Structs, Modules
    local teal = "#4abaaf" -- Use for Units?
    local green2 = "#12e6b5" -- Snippets

    hl(0, "BlinkCmpKindField", { bg = "None", fg = blue5 }) -- Lighter blue for fields
    hl(0, "BlinkCmpKindProperty", { bg = "None", fg = blue5 })
    hl(0, "BlinkCmpKindEvent", { bg = "None", fg = red })

    hl(0, "BlinkCmpKindText", { bg = "None", fg = green })
    hl(0, "BlinkCmpKindEnum", { bg = "None", fg = yellow })
    hl(0, "BlinkCmpKindKeyword", { bg = "None", fg = magenta })

    hl(0, "BlinkCmpKindConstant", { bg = "None", fg = orange })
    hl(0, "BlinkCmpKindConstructor", { bg = "None", fg = blue }) -- Same as function
    hl(0, "BlinkCmpKindReference", { bg = "None", fg = blue5 }) -- Like variable/property

    hl(0, "BlinkCmpKindFunction", { bg = "None", fg = blue })
    hl(0, "BlinkCmpKindStruct", { bg = "None", fg = green1 })
    hl(0, "BlinkCmpKindClass", { bg = "None", fg = yellow })
    hl(0, "BlinkCmpKindModule", { bg = "None", fg = green1 })
    hl(0, "BlinkCmpKindOperator", { bg = "None", fg = cyan })

    hl(0, "BlinkCmpKindVariable", { bg = "None", fg = blue5 }) -- Use lighter blue
    hl(0, "BlinkCmpKindFile", { bg = "None", fg = cyan })

    hl(0, "BlinkCmpKindUnit", { bg = "None", fg = teal })
    hl(0, "BlinkCmpKindSnippet", { bg = "None", fg = green2 })
    hl(0, "BlinkCmpKindFolder", { bg = "None", fg = cyan })

    hl(0, "BlinkCmpKindMethod", { bg = "None", fg = blue })
    hl(0, "BlinkCmpKindValue", { bg = "None", fg = orange })
    hl(0, "BlinkCmpKindEnumMember", { bg = "None", fg = blue5 })

    hl(0, "BlinkCmpKindInterface", { bg = "None", fg = yellow })
    hl(0, "BlinkCmpKindColor", { bg = "None", fg = orange })
    hl(0, "BlinkCmpKindTypeParameter", { bg = "None", fg = red })

    hl(0, "BlinkCmpKindCopilot", { bg = "None", fg = green })
end

set_highlights_blink()
