onetime_waypoint = {
    maintainer = "taikedz-mt",
    version = "20190124"
}

onetime_waypoint.saver = datasaver:new("onetime_waypoint", "waypoints")
onetime_waypoint.waypoints = onetime_waypoint.saver:load()

local modpath = minetest.get_modpath("onetime_waypoint")

dofile(modpath.."/lua/craft.lua")
dofile(modpath.."/lua/items.lua")
dofile(modpath.."/lua/nodes.lua")
