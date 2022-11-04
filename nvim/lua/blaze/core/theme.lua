local colorscheme = "tokyonight"

local _, status = pcall(require, colorscheme)

if not status then
  print("Colorscheme " .. colorscheme .. " not found")
  return
end

require(colorscheme).setup({
  transparent = true
})

vim.cmd('colorscheme ' .. colorscheme)
