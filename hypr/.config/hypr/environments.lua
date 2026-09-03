--[[
#############################
### ENVIRONMENT VARIABLES ###
#############################

# See https://wiki.hyprland.org/Configuring/Environment-variables/

env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_QPA_PLATFORM,wayland

env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = QT_QPA_PLATFORM,wayland
env = MOZ_ENABLE_WAYLAND,1
]]
Hypr.env("XCURSOR_SIZE", "24")
Hypr.env("HYPRCURSOR_SIZE", "24")
Hypr.env("QT_QPA_PLATFORMTHEME", "qt6ct")
Hypr.env("QT_QPA_PLATFORM", "wayland")

Hypr.env("XDG_CURRENT_DESKTOP", "Hyprland")
Hypr.env("XDG_SESSION_TYPE", "wayland")
Hypr.env("QT_QPA_PLATFORM", "wayland")
Hypr.env("MOZ_ENABLE_WAYLAND", "1")
