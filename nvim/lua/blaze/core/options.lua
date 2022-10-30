local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  hidden = true,
  number = true,
  relativenumber = true,
  termguicolors = true,
  scrolloff = 10,
  swapfile = false,
  backup = false,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  mouse = ''
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
