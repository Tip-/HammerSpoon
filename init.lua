hs.window.animationDuration = 0

require "window-management"
require "key-binding"

function reloadConfig(files)
  local doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
    hs.alert.show('Config Reloaded')
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", function()
  hs.reload()
end)

hs.alert.show("Config loaded")
