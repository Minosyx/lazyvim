local function set_highlights_cmp()
    local hl = vim.api.nvim_set_hl

    hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
    hl(0, "Pmenu", { fg = "#9C9C9C", bg = "NONE" })

    hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    hl(0, "CmpItemAbbr", { fg = "#DADADA", bg = "NONE" })
    hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

    hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
    hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
    hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

    hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#28402E" })
    hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#28402E" })
    hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#28402E" })

    hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
    hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
    hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

    hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
    hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
    hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
    hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
    hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

    hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
    hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

    hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
    hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
    hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

    hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
    hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
    hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

    hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
    hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
    hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

    hl(0, "CmpItemKindCopilot", { fg = "#6CC644", bg = "#1A2A1A" })
end

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
    hl(0, "BlinkCmpKindSnippet", { bg = "None", fg = green })
    hl(0, "BlinkCmpKindFolder", { bg = "None", fg = cyan })

    hl(0, "BlinkCmpKindMethod", { bg = "None", fg = blue })
    hl(0, "BlinkCmpKindValue", { bg = "None", fg = orange })
    hl(0, "BlinkCmpKindEnumMember", { bg = "None", fg = blue5 })

    hl(0, "BlinkCmpKindInterface", { bg = "None", fg = yellow })
    hl(0, "BlinkCmpKindColor", { bg = "None", fg = orange })
    hl(0, "BlinkCmpKindTypeParameter", { bg = "None", fg = red })

    hl(0, "BlinkCmpKindCopilot", { bg = "None", fg = green })
end

---@enum CMP_MODULE
local CMP_MODULE = {
    Blink = 0,
    Cmp = 1,
}

---@param module CMP_MODULE
local function set_highlights(module)
    if module == CMP_MODULE.Blink then
        set_highlights_blink()
    else
        set_highlights_cmp()
    end
end

set_highlights(CMP_MODULE.Blink)
