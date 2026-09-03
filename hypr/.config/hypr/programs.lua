-- MY PROGRAMS

-- Set programs that you use
Terminal = "kitty"
FileManager = "nautilus"
Menu = "wofi --show"
Browser = "google-chrome-stable"

-- AUTOSTART ###
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

Hypr.on("hyprland.start", function()
	Hypr.exec_cmd(Browser)
	Hypr.exec_cmd(Terminal)
	Hypr.exec_cmd("waybar & swaync & hypridle & hyprpaper")
	Hypr.exec_cmd("~/.config/hypr/wallpeaper-script.sh")
	Hypr.exec_cmd("clipse -listen")
end)
