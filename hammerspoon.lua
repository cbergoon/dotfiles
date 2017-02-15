local log = hs.logger.new('CMB Config','debug')
log.i('Initializing') 

-- Remap Arrow Keys

local function keyCode(key, modifiers)
  modifiers = modifiers or {}

  return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function mouseMoveUp()
  return function()
	hs.mouse.setAbsolutePosition({ x=hs.mouse.getAbsolutePosition().x, y=hs.mouse.getAbsolutePosition().y - 4 })
  end
end

local function mouseMoveDown()
  return function()
	hs.mouse.setAbsolutePosition({ x=hs.mouse.getAbsolutePosition().x, y=hs.mouse.getAbsolutePosition().y + 4 })
  end
end

local function mouseMoveRight()
  return function()
	hs.mouse.setAbsolutePosition({ x=hs.mouse.getAbsolutePosition().x + 4, y=hs.mouse.getAbsolutePosition().y })
  end
end

local function mouseMoveLeft()
  return function()
	hs.mouse.setAbsolutePosition({ x=hs.mouse.getAbsolutePosition().x - 4, y=hs.mouse.getAbsolutePosition().y })
  end
end

local function mouseClick()
  return function()
	hs.eventtap.leftClick(hs.mouse.getAbsolutePosition())
  end
end

hs.hotkey.bind({'ctrl'}, 'w', mouseMoveUp(), nil, mouseMoveUp())
hs.hotkey.bind({'ctrl'}, 'a', mouseMoveLeft(), nil, mouseMoveLeft())
hs.hotkey.bind({'ctrl'}, 's', mouseMoveDown(), nil, mouseMoveDown())
hs.hotkey.bind({'ctrl'}, 'd', mouseMoveRight(), nil, mouseMoveRight())

hs.hotkey.bind({'ctrl'}, '`', mouseClick(), nil, mouseClick())


hs.hotkey.bind({'ctrl'}, 'h', keyCode('left'), nil, keyCode('left'))
hs.hotkey.bind({'ctrl'}, 'j', keyCode('down'), nil, keyCode('down'))
hs.hotkey.bind({'ctrl'}, 'k', keyCode('up'), nil, keyCode('up'))
hs.hotkey.bind({'ctrl'}, 'l', keyCode('right'), nil, keyCode('right'))

hs.hotkey.bind({'ctrl', 'shift'}, 'h', keyCode('left', {'shift'}), nil, keyCode('left', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'j', keyCode('down', {'shift'}), nil, keyCode('down', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'k', keyCode('up', {'shift'}), nil, keyCode('up', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'l', keyCode('right', {'shift'}), nil, keyCode('right', {'shift'}))

hs.hotkey.bind({'ctrl', 'cmd'}, 'h', keyCode('left', {'cmd'}), nil, keyCode('left', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'j', keyCode('down', {'cmd'}), nil, keyCode('down', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'k', keyCode('up', {'cmd'}), nil, keyCode('up', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'l', keyCode('right', {'cmd'}), nil, keyCode('right', {'cmd'}))

hs.hotkey.bind({'ctrl', 'alt'}, 'h', keyCode('left', {'alt'}), nil, keyCode('left', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'j', keyCode('down', {'alt'}), nil, keyCode('down', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'k', keyCode('up', {'alt'}), nil, keyCode('up', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'l', keyCode('right', {'alt'}), nil, keyCode('right', {'alt'}))

hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'h', keyCode('left', {'shift', 'cmd'}), nil, keyCode('left', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'j', keyCode('down', {'shift', 'cmd'}), nil, keyCode('down', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'k', keyCode('up', {'shift', 'cmd'}), nil, keyCode('up', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'l', keyCode('right', {'shift', 'cmd'}), nil, keyCode('right', {'shift', 'cmd'}))

hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'h', keyCode('left', {'shift', 'alt'}), nil, keyCode('left', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'j', keyCode('down', {'shift', 'alt'}), nil, keyCode('down', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'k', keyCode('up', {'shift', 'alt'}), nil, keyCode('up', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'l', keyCode('right', {'shift', 'alt'}), nil, keyCode('right', {'shift', 'alt'}))

hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'h', keyCode('left', {'cmd', 'alt'}), nil, keyCode('left', {'cmd', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'j', keyCode('down', {'cmd', 'alt'}), nil, keyCode('down', {'cmd', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'k', keyCode('up', {'cmd', 'alt'}), nil, keyCode('up', {'cmd', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'l', keyCode('right', {'cmd', 'alt'}), nil, keyCode('right', {'cmd', 'alt'}))

-- Read Line Key Mappings

hs.hotkey.bind({"alt"}, 'f', function()-- {{{2
    hs.eventtap.keyStroke({"alt"}, "Right")
end)-- }}}2

hs.hotkey.bind({"alt"}, 'b', function()-- {{{2
    hs.eventtap.keyStroke({"alt"}, "Left")
end)-- }}}2

hs.hotkey.bind({"alt"}, ',', function()-- {{{2
    hs.eventtap.keyStroke({"cmd"}, "Up")
end)-- }}}2

hs.hotkey.bind({"alt"}, '.', function()-- {{{2
    hs.eventtap.keyStroke({"cmd"}, "Down")
end)-- }}}2

hs.hotkey.bind({"alt"}, 'd', function()-- {{{2
    hs.eventtap.keyStroke({"ctrl", "alt", "shift"}, "f")
    hs.eventtap.keyStroke({}, "delete")
end)-- }}}2

--hs.hotkey.bind({"ctrl"}, 'w', function()-- {{{2
--    hs.eventtap.keyStroke({"ctrl"}, "k")
--end)-- }}}2
