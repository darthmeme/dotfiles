local colorscheme = "default"

local colorscheme_status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not colorscheme_status then
  print("Colorscheme " .. colorscheme .. " not found")
  return
end
