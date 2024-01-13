local cmd = vim.cmd

local opt = vim.opt

local g = vim.g
local indent = 2

cmd([[
	filetype plugin indent on
]])

opt.backspace = { "eol", "start", "indent" }
opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
opt.encoding = "utf-8"
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent
opt.shiftround = true

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }
opt.wildmenu = true

opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true

opt.listchars = {
  tab = "┊ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×",
}

opt.cmdheight = 0

opt.mouse = "a"
opt.number = true
opt.scrolloff = 18
opt.sidescrolloff = 3
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.wrap = true

opt.backup = false
opt.swapfile = false
opt.writebackup = false

opt.completeopt = { "menu", "menuone", "noselect" }

opt.showmode = false

opt.history = 100
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100

opt.termguicolors = true

local undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true
opt.undodir = undodir
opt.undolevels = 1000
opt.undoreload = 10000

opt.foldmethod = "marker"
opt.foldlevel = 99

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
})

opt.number = true
opt.relativenumber = false

opt.laststatus = 2
g.netrw_banner = 0
g.netrw_keepdir = 0
g.netrw_liststyle = 0
g.netrw_localcopydircmd = "cp -r"
opt.lazyredraw = false

vim.cmd.colorscheme("catppuccin")

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
