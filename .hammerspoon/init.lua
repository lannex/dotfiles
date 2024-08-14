-- NOTE: Binding Hotkeys
hs.hotkey.bind({"ctrl", "shift"}, "a", function()
    hs.application.launchOrFocus("Arc.app")
end)

hs.hotkey.bind({"ctrl", "shift"}, "v", function()
    hs.application.launchOrFocus("Visual Studio Code.app")
end)

hs.hotkey.bind({"ctrl", "shift"}, "c", function()
    hs.application.launchOrFocus("Google Chrome.app")
end)

hs.hotkey.bind({"ctrl", "shift"}, "s", function()
    hs.application.launchOrFocus("Slack.app")
end)

-- NOTE: Switching from Korean to English by pressing ESC
-- local inputEnglish = "com.apple.keylayout.ABC"
-- local esc_bind

-- function back_to_eng()
--     local inputSource = hs.keycodes.currentSourceID()
--     if not (inputSource == inputEnglish) then
--         hs.keycodes.currentSourceID(inputEnglish)
--     end
--     esc_bind:disable()
--     hs.eventtap.keyStroke({}, 'escape')
--     esc_bind:enable()
-- end

-- esc_bind = hs.hotkey.new({}, 'escape', back_to_eng):enable()
