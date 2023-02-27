--      ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--      ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--      ██████╔╝██║   ██║██║     █████╗  ███████╗
--      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
--      ██║  ██║╚██████╔╝███████╗███████╗███████║
--      ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")

-- define screen height and width
local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- define module table
local rules = {}


-- ===================================================================
-- Rules
-- ===================================================================


-- return a table of client rules including provided keys / buttons
function rules.create(clientkeys, clientbuttons)
   local rofi_rule = {}

    rofi_rule = {
       rule_any = {name = {"rofi"}},
       properties = {floating = true, titlebars_enabled = false},
       callback = function(c)
          if beautiful.name == "mirage" then
             awful.placement.left(c)
          end
       end
    }

   return {
      -- All clients will match this rule.
      {
         rule = {},
         properties = {
            titlebars_enabled = true,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            callback = awful.client.setslave,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            size_hints_honor = false,
         },
      },
      -- Floating clients.
      {
         rule_any = {
            instance = {
               "DTA",
               "copyq",
            },
            class = {
               "Nm-connection-editor"
            },
            name = {
               "Event Tester",
               "Steam Guard - Computer Authorization Required",
               "GlslView"
            },
            role = {
               "pop-up",
               "GtkFileChooserDialog"
            },
            type = {
               "dialog"
            }
         }, properties = {floating = true}
      },

      -- Fullscreen clients
      {
         rule_any = {
            class = {
               "Terraria.bin.x86",
            },
         }, properties = {fullscreen = true}
      },

      -- "Switch to tag"
      -- These clients make you switch to their tag when they appear
      {
         rule_any = {
            class = {
               "Firefox"
            },
         }, properties = {
           maximized_horizontal = false,
           maximized_vertical = false,
         }
      },

      -- Specific tags
      {
         rule_any = {
            class = {
               "[Ss]potify"
            },
         }, properties = {
           tag = "5",
           screen = "DP-4"
         }
      },

      {
         rule_any = {
            class = {
               "Steam"
            },
         }, properties = {
           tag = "4",
           screen = "DP-4"
         }
      },
      -- Visualizer
      {
         rule_any = {name = {"cava"}},
         properties = {
            floating = true,
            maximized_horizontal = true,
            sticky = true,
            ontop = false,
            skip_taskbar = true,
            below = true,
            focusable = false,
            height = screen_height * 0.40,
            opacity = 0.6
         },
         callback = function (c)
            decorations.hide(c)
            awful.placement.bottom(c)
         end
      },

      -- rofi rule determined above
      rofi_rule,

      -- File chooser dialog
      {
         rule_any = {role = {"GtkFileChooserDialog"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.65}
      },

      -- Pavucontrol & Bluetooth Devices
      {
         rule_any = {class = {"Pavucontrol"}, name = {"Bluetooth Devices"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.45}
      },

      -- League
     {
       rule = { instance = "league of legends.exe" },
       properties = {},
       callback = function (c)
         local matcher = function (c)
           return awful.rules.match(c, { instance = "leagueclientux.exe" })
         end
         -- Minimize LoL client after game window opens
         for c in awful.client.iterate(matcher) do
           c.urgent = false
           c.minimized = true
         end

         -- Unminimize LoL client after game window closes
         c:connect_signal("unmanage", function()
           for c in awful.client.iterate(matcher) do
             c.minimized = false
           end
         end)
       end
     },
   }

 end

-- return module table
return rules
