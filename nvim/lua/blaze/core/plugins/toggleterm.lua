local _, status = pcall(require, 'toggleterm')

if not status then
  return
end

require('toggleterm').setup({
  direction = 'float'
})
