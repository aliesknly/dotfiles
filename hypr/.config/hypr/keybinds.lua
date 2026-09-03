-- KEYBINDINGSS

local keybind = require("utils").keybind
local dsp = Hypr.dsp
local bind = Hypr.bind
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local enter = "return" -- Sets "Enter" key as enter key

bind(keybind(mainMod, enter), dsp.exec_cmd(Terminal), { description = "Open terminal" })
bind(keybind(mainMod, "C"), dsp.window.close(), { description = "Close active window" })
bind(
	keybind(mainMod, "M"),
	dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	{ description = "Close section" }
)
bind(keybind(mainMod, "E"), dsp.exec_cmd(FileManager), { description = "Open FileManager" })
bind(keybind(mainMod, "V"), dsp.window.float({ action = "toggle" }))
bind(keybind(mainMod, "space"), dsp.exec_cmd(Menu), { description = "Open menu" })
bind(keybind(mainMod, "P"), dsp.window.pseudo())
bind(keybind(mainMod, "A"), dsp.layout("togglesplit"))
bind(keybind(mainMod, "SHIFT + L"), dsp.exec_cmd("hyprlock"))
bind(keybind(mainMod, "SHIFT + W"), dsp.exec_cmd("~/.config/hypr/wallpeaper-script.sh"))

-- Move focus with mainMod + arrow keys
bind(keybind(mainMod, "h"), dsp.focus({ direction = "left" }), { description = "Select left window" })
bind(keybind(mainMod, "l"), dsp.focus({ direction = "right" }), { description = "Select right window" })
bind(keybind(mainMod, "k"), dsp.focus({ direction = "up" }), { description = "Select up window" })
bind(keybind(mainMod, "j"), dsp.focus({ direction = "down" }), { description = "Select down window" })

-- Switch workspaces with mainMod + [0-9] and move windows to workspace
for i = 1, 10 do
	local key = i % 10
	bind(keybind(mainMod, key), dsp.focus({ workspace = i }), { description = "Switch workspace " .. i })
	bind(
		keybind(mainMod, "SHIFT", key),
		dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)
end

-- Example special workspace (scratchpad)
bind(keybind(mainMod, "S"), dsp.workspace.toggle_special("magic"))
bind(keybind(mainMod, "SHIFT + S"), dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
bind(keybind(mainMod, "mouse_down"), dsp.focus({ workspace = "e+1" }))
bind(keybind(mainMod, "mouse_up"), dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(keybind(mainMod, "mouse:272"), dsp.window.drag(), { mouse = true })
bind(keybind(mainMod, "mouse:273"), dsp.window.resize(), { mouse = true })
bind(
	keybind(mainMod, "ALT + h"),
	dsp.window.resize({ x = -30, y = 0, relative = true }),
	{ description = "Resize window to left" }
)
bind(
	keybind(mainMod, "ALT + l"),
	dsp.window.resize({ x = 30, y = 0, relative = true }),
	{ description = "Resize window to right" }
)
bind(
	keybind(mainMod, "ALT + k"),
	dsp.window.resize({ x = 0, y = -30, relative = true }),
	{ description = "Resize window to down" }
)
bind(
	keybind(mainMod, "ALT + j"),
	dsp.window.resize({ x = 0, y = 30, relative = true }),
	{ description = "Resize window to up" }
)

-- Screenshots by region
bind(
	keybind(mainMod, "CONTROL + r"),
	dsp.exec_cmd("hyprshot -m region"),
	{ description = "Take screenshot from region" }
)

-- Take screenshot by windows
bind(
	keybind(mainMod, "CONTROL + w"),
	dsp.exec_cmd("hyprshot -m window"),
	{ description = "Take screenshot form window" }
)

-- Clipboard
bind(
	keybind(mainMod, "SHIFT + v"),
	dsp.exec_cmd("kitty --class clipboard -e 'clipse'"),
	{ description = "Open clipboard" }
)

-- Shutdown
bind(
	keybind(mainMod, "Q"),
	dsp.exec_cmd('hyprshutdown -t "Shutting down..." --post-cmd "shutdown -P 0"'),
	{ description = "Shutdown..." }
)
