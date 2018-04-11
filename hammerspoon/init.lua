-- Setup global logger
logger = hs.logger.new('hammerspoon', 'debug')
logger.defaultLogLevel="debug"
logger.setGlobalLogLevel="debug"
logger.setModulesLogLevel="debug"

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

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
	screens = hs.screen.allScreens()
end)
screenwatcher:start()

hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

-- A global variable for the sub-key Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Hyper-key for all the below are setup somewhere... Usually Keyboard Maestro or similar. Alfred doesn't handle them very well, so will set up separate bindings for individual apps below.
hyperBindings = {'c','m','a','b','d','e','f','g','h','i','j','k','l','m','n','p','q','r','t','1','2','3','4','5','6','7','8','9','0','d','g','s','f','TAB','v','b','O','-','s'}

for i,key in ipairs(hyperBindings) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke(hyper, key)
    k.triggered = true
  end)
end

-- Code to launch single apps
-- Hat-Tip: https://gist.github.com/ttscoff/cce98a711b5476166792d5e6f1ac5907
launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

-- Keybinding for specific single apps.
singleapps = {
  {'c', 'Google Chrome'},
  {'i', 'iTerm'},
  {'h', 'Hipchat'},
}

for i, app in ipairs(singleapps) do
  k:bind({}, app[1], function() launch(app[2]); k:exit(); end)
end

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f19 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- require('modules/window_manager')
require('modules/position')
require('modules/keyboard_lang')
require('modules/window_manager')

--
-- Lock screen shortcut
--
hs.hotkey.bind({"cmd", "shift"}, 'L', function ()
  hs.caffeinate.startScreensaver()
end)

--
-- Print table function
--
printTable = function(table)
  for key,value in pairs(table) do
    logger.df("Key = %s, Value = %s", key, value)
  end
end
