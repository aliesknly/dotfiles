-- WINDOWS AND WORKSPACES

local window_rule = Hypr.window_rule
local workspace_rule = Hypr.workspace_rule

-- Clipse clipboard window
window_rule({
	name = "clipboard",
	match = {
		class = "clipboard",
	},
	float = true,
	size = { 622, 652 },
	center = true,
})

-- Used by btop app
window_rule({
	name = "process",
	match = {
		class = "process",
	},
	float = true,
	size = { 900, 976 },
	center = true,
})

-- Used by bluetooth and wifi
window_rule({
	name = "wireless",
	match = {
		class = "wireless",
	},
	float = true,
	size = { 922, 652 },
	center = true,
})

-- Browser
window_rule({
	name = "browser-chrome",
	match = {
		class = "google-chrome",
	},
	workspace = 1,
})

--Workspace to monitor eDP-1(Laptop)
workspace_rule({
	workspace = "1",
	monitor = "eDP-1",
})
