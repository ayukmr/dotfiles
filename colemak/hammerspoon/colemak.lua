-- ===========================
-- === Hammerspoon Colemak ===
-- ===========================

-- qwerty window filter
qwertyFilter = hs.window.filter.new { "kitty", "sioyek" }

-- colemak when unfocused
qwertyFilter:subscribe(
    hs.window.filter.windowUnfocused,
    function()
        hs.keycodes.setLayout("Colemak")
    end
)

-- qwerty when focused
qwertyFilter:subscribe(
    hs.window.filter.windowFocused,
    function()
        hs.keycodes.setLayout("ABC")
    end
)
