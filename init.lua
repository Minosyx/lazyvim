-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.highlights")

-- launch only when started with neovide
if vim.g.neovide then
    require("config.neovide")
end

vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500,a:Cursor/lCursor"
