local colorscheme = "tokyonight"

require(colorscheme).setup({
  style = 'moon',
  transparent = true,
  on_highlights = function (highlights)
    highlights.LineNr = {
      fg = '#65737e'
    }
  end
})

local _, colorscheme_status = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not colorscheme_status then
  print("colorscheme " .. colorscheme .. " not found")
  return
end
