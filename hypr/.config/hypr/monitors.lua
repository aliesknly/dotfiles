--[[
--
################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
#monitor=,preferred,auto,auto
# Monitor 1 - eDP-1 (right)
#monitor = eDP-1, 1920x1080@144, 1920x0, 1

# Monitor 3 - DP-6 (left-down)
#monitor = DP-6, 1920x1080@60, 0x0, 1

# Monitor 2 - DP-5 (left-up)
#monitor = DP-5, 1920x1080@60, 0x-1080, 1

# Workspaces
workspace=1,monitor:eDP-1
workspace=2,monitor:DP-2
#workspace=3,minitor:DP-5

--]]

Hypr.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1,
	--reserved_area = { top = 200, botton = 0, left = 0, right = 0 },
})

Hypr.monitor({
	output = "DP-2",
	mode = "1920x1080",
	position = "1920x0",
	scale = 1,
})
