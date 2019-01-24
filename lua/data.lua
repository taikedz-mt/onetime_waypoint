local saver = datasaver:new("onetime_waypoint", "waypoints")
local waypoints = saver:load()

function onetime_waypoint:set_waypoint(playername, waypoint_position)
    waypoints[playername] = waypoint_position
    saver:save(waypoints)
end

function onetime_waypoint:get_waypoint(playername)
    return waypoints[playername]
end
