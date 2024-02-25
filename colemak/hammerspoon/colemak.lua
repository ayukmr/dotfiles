-- ===========================
-- === Hammerspoon Colemak ===
-- ===========================

-- terminal window filter
terminalFilter =
    hs.window.filter.new { 'kitty', 'Alacritty' }

-- colemak when unfocused
terminalFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hs.keycodes.setLayout('Colemak')
end)

-- qwerty when focused
terminalFilter:subscribe(hs.window.filter.windowFocused, function()
    hs.keycodes.setLayout('ABC')
end)
