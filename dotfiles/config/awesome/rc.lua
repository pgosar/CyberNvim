-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local batteryarc_widget = require(
                              "awesome-wm-widgets.batteryarc-widget.batteryarc")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local logout_popup = require(
                         "awesome-wm-widgets.logout-popup-widget.logout-popup")
local brightness_widget = require(
                              "awesome-wm-widgets.brightness-widget.brightness")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "Oops, an error happened" ..
            (startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

local minimized = true
-- This is used later as the default terminal and editor to run.
local terminal = "/home/chilly/.local/bin/kitty"
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
local modkey = "Mod4"
-- }}}

-- Autorun programs
local autorun = true
local autorunApps = {
    "nitrogen --restore", "picom", "watch_tablet &",
    "/usr/lib/polkit-1/polkitd --no-debug",
    "exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &",
    "blueman-applet &", "nm-applet &", "onboard &", "pa-applet &"

}
if autorun then
    for app = 1, #autorunApps do awful.util.spawn(autorunApps[app]) end
end

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile, awful.layout.suit.floating,
        awful.layout.suit.tile.left, awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top, awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal, awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle, awful.layout.suit.max,
        awful.layout.suit.max.fullscreen, awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw
    })
end)
-- }}}

-- {{{ Wibar
--

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s,
              awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(-1) end),
            awful.button({}, 5, function() awful.layout.inc(1) end)
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({modkey}, 1, function(t)
                if client.focus then client.focus:move_to_tag(t) end
            end), awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({modkey}, 3, function(t)
                if client.focus then client.focus:toggle_tag(t) end
            end),
            awful.button({}, 4, function(t)
                awful.tag.viewprev(t.screen)
            end),
            awful.button({}, 5, function(t)
                awful.tag.viewnext(t.screen)
            end)
        }
    }
    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        screen = s,
        widget = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox
            },
            {
                -- middle widgets
                s.mytasklist,
                layout = wibox.layout.fixed.horizontal,
                spotify_widget()
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray {},
                brightness_widget {},
                logout_popup.widget {},
                volume_widget {},
                batteryarc_widget{
                    arc_thickness = 3,
                    arc_color = "#5AA3CC",
                    show_current_level = true,
                    size = 52,
                    warning_msg_title = "Low Battery",
                    notification_position = "top_right",
                    show_current_level_persentage = true,
                    battery = "BAT0"
                },
                mytextclock
            }
        }
    }
end)
-- }}}
--
-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext)
})
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({

    awful.key({modkey}, ";", function() brightness_widget:inc() end,
              {description = "increase brightness", group = "custom"}),
    awful.key({modkey, "Shift"}, ";", function() brightness_widget:dec() end,
              {description = "decrease brightness", group = "custom"}),
    awful.key({modkey}, "]", function() volume_widget:inc(5) end),
    awful.key({modkey}, "[", function() volume_widget:dec(5) end),
    awful.key({modkey}, "\\", function() volume_widget:toggle() end),
    awful.key({modkey}, "s", hotkeys_popup.show_help,
                    {description = "show help", group = "awesome"}),
    awful.key({modkey, "Control"}, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({modkey, "Shift"}, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({modkey}, "Return", function() awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({modkey}, "r",
              function() awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
    awful.key({modkey}, "d",
              function() awful.spawn('rofi -modi drun, run -show drun') end,
              {description = "open rofi", group = "launcher"})
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({modkey}, "Left", awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({modkey}, "Right", awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({modkey}, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"})
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "client"}),
    awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end,
              {description = "focus previous by index", group = "client"}),
    awful.key({modkey}, "Tab", function()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end, {description = "go back", group = "client"}),
    awful.key({modkey, "Control"}, "j",
              function() awful.screen.focus_relative(1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({modkey, "Control"}, "k",
              function() awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({modkey, "Control"}, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then c:activate{raise = true, context = "key.unminimize"} end
    end, {description = "restore minimized", group = "client"})
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({modkey, "Shift"}, "j", function() awful.client.swap.byidx(1) end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({modkey, "Shift"}, "k",
              function() awful.client.swap.byidx(-1) end, {
        description = "swap with previous client by index",
        group = "client"
    }), awful.key({modkey}, "u", awful.client.urgent.jumpto,
                  {description = "jump to urgent client", group = "client"}),
    awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({modkey, "Shift"}, "h",
              function() awful.tag.incnmaster(1, nil, true) end, {
        description = "increase the number of master clients",
        group = "layout"
    }), awful.key({modkey, "Shift"}, "l",
                  function() awful.tag.incnmaster(-1, nil, true) end, {
        description = "decrease the number of master clients",
        group = "layout"
    }), awful.key({modkey, "Control"}, "h",
                  function() awful.tag.incncol(1, nil, true) end, {
        description = "increase the number of columns",
        group = "layout"
    }), awful.key({modkey, "Control"}, "l",
                  function() awful.tag.incncol(-1, nil, true) end, {
        description = "decrease the number of columns",
        group = "layout"
    }), awful.key({modkey}, "space", function() awful.layout.inc(1) end,
                  {description = "select next", group = "layout"}),
    awful.key({modkey, "Shift"}, "space", function() awful.layout.inc(-1) end,
              {description = "select previous", group = "layout"})
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = {modkey},
        keygroup = "numrow",
        description = "only view tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then tag:view_only() end
        end
    }, awful.key {
        modifiers = {modkey, "Control"},
        keygroup = "numrow",
        description = "toggle tag",
        group = "tag",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then awful.tag.viewtoggle(tag) end
        end
    }, awful.key {
        modifiers = {modkey, "Shift"},
        keygroup = "numrow",
        description = "move focused client to tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then client.focus:move_to_tag(tag) end
            end
        end
    }, awful.key {
        modifiers = {modkey, "Control", "Shift"},
        keygroup = "numrow",
        description = "toggle focused client on tag",
        group = "tag",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then client.focus:toggle_tag(tag) end
            end
        end
    }, awful.key {
        modifiers = {modkey},
        keygroup = "numpad",
        description = "select layout directly",
        group = "layout",
        on_press = function(index)
            local t = awful.screen.focused().selected_tag
            if t then t.layout = t.layouts[index] or t.layout end
        end
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}, 1, function(c)
            c:activate{context = "mouse_click"}
        end), awful.button({modkey}, 1, function(c)
            c:activate{context = "mouse_click", action = "mouse_move"}
        end), awful.button({modkey}, 3, function(c)
            c:activate{context = "mouse_click", action = "mouse_resize"}
        end)
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({modkey}, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}),
        awful.key({modkey, "Shift"}, "c", function(c) c:kill() end,
                  {description = "close", group = "client"}),
        awful.key({modkey, "Control"}, "space", awful.client.floating.toggle,
                  {description = "toggle floating", group = "client"}),
        awful.key({modkey, "Control"}, "Return",
                  function(c) c:swap(awful.client.getmaster()) end,
                  {description = "move to master", group = "client"}),
        awful.key({modkey}, "o", function(c) c:move_to_screen() end,
                  {description = "move to screen", group = "client"}),
        --[[ awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop           end,
           [         {description = "toggle keep on top", group = "client"}), ]]
        awful.key({modkey}, "n", function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, {description = "minimize", group = "client"}),
        awful.key({modkey}, "m", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "(un)maximize", group = "client"}),
        awful.key({modkey, "Control"}, "m", function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end, {description = "(un)maximize vertically", group = "client"}),
        awful.key({modkey, "Shift"}, "m", function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end, {description = "(un)maximize horizontally", group = "client"})
    })
end)

-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }

    ruled.client.append_rule {
      id = "global",
      rule = {name = "Onboard"},
      properties = {focusable = false}
    }

    -- Floating clients.
    ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = {"copyq", "pinentry"},
            class = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {floating = true}
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = {type = {"normal", "dialog"}},
        properties = {titlebars_enabled = true}
    }
end)
-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({}, 1, function()
            c:activate{context = "titlebar", action = "mouse_move"}
        end), awful.button({}, 3, function()
            c:activate{context = "titlebar", action = "mouse_resize"}
        end)
    }

    awful.titlebar(c).widget = {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end)
-- }}}

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = {},
        properties = {screen = awful.screen.preferred, implicit_timeout = 5}
    }
end)

naughty.connect_signal("request::display",
                       function(n) naughty.layout.box {notification = n} end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = false}
end)

-- No borders if only one window on screen
local function border_adjust(c)
    if #c.screen.clients == 1 then
        c.border_width = 0
    elseif #c.screen.clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

-- No gaps if only one window on screen
local function gap_adjust(c)
    if #c.screen.clients == 1 then
        beautiful.useless_gap = 0
    elseif #c.screen.clients > 1 then
        beautiful.useless_gap = 3
    end
end
beautiful.gap_single_client = false
client.connect_signal("focus", border_adjust)
client.connect_signal("focus", gap_adjust)
