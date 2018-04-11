--
-- Set Keyboard language based on connected USB device
-- Requires 'keyboardSwitcher' util, from https://github.com/Lutzifer/keyboardSwitcher
--
function configureKeyboard(data)
  local keyboardSwitcher = '/usr/local/bin/keyboardSwitcher'
  local isKeyboardAffected = (data.vendorID == 1118 and data.productID == 221) -- Work Keyboard
    or (data.vendorID == 1133 and data.productID == 49699) -- Home keyboard
  logger.df("eventType %s, pname %s, vname %s, vId %s, pId %s, keyboardAffected %s", data.eventType, data.productName, data.vendorName, data.vendorID, data.productID, isKeyboardAffected)
  if isKeyboardAffected and data.eventType == "added" then
    os.execute(keyboardSwitcher .. ' select "British - PC"')
  end
  if isKeyboardAffected and data.eventType == "removed" then
    os.execute(keyboardSwitcher .. ' select British')
  end
end

local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
keyboardWatcher:start()
