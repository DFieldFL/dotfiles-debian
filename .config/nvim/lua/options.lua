local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "120"

opt.statuscolumn = [[%!v:lua.require("util.ui").statuscolumn()]]
-- opt.statuscolumn = "%s %3l %3r "
opt.list = true
opt.listchars = {
    space = "·",
    trail = "·",
    tab = "⇥ ",
    eol = "⮐",
    extends = "»",
    precedes = "«",
    nbsp = "+",
}
