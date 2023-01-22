-- ===========================
-- === Hammerspoon Colemak ===
-- ===========================

-- terminal window filter
terminalFilter =
    hs.window.filter.new { 'iTerm2', 'Terminal', 'Alacritty', 'Hyper' }

-- set colemak when unfocused
terminalFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hs.keycodes.setLayout('Colemak')
end)

-- set qwerty when focused
terminalFilter:subscribe(hs.window.filter.windowFocused, function()
    hs.keycodes.setLayout('ABC')
end)
