minetest.register_node("onetime_waypoint:waypoint", {
    groups = {oddly_diggable_by_hand = 1, dig_immediate = 1},

    on_dig = function(digger)
        -- check ownership of node
        -- remove waypoint
    end,

    on_place = function(pointer, pointedthing)
        -- check protection
        -- remove old waypoint
        -- place new waypoint
        -- set owner
    end,
    on_use = function(pointer, pointedthing)
        -- get player waypoint
        -- go to pos
        -- remove waypoint
    end,
})
