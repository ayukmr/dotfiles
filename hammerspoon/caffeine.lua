-- ====================================
-- === Hammerspoon Caffeine Menulet ===
-- ====================================

-- caffeine menulet
caffeine = hs.menubar.new()

-- set caffeine title
function setTitle(caffeinated)
    if caffeinated then
        caffeine:setTitle('􀸙')
    else
        caffeine:setTitle('􀸘')
    end
end

-- toggle caffeine
caffeine:setClickCallback(function()
    setTitle(hs.caffeinate.toggle('displayIdle'))
end)

setTitle(hs.caffeinate.get('displayIdle'))
