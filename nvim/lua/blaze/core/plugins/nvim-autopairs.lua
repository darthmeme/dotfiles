local _, status = pcall(require, 'nvim-autopairs')

if not status then
  return
end

require('nvim-autopairs').setup()
