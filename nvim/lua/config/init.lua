local function init()
  require('config.options')
  require('config.keymaps')
  require('config.lazy')
end

return {
  init = init
}
