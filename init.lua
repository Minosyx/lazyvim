-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.highlights")

-- launch only when started with neovide
if vim.g.neovide then
    require("config.neovide")
end
