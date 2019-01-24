minetest.register_craftitem("onetime_waypoint:waypoint", {
    inventory_image = "default_stick.png^[colorize:yellow:140",
    stack_max = 1,
    liquids_pointable = true,

    on_place = function(itemstack, pointer, pointedthing)
        -- check protection
        local playername = pointer:get_player_name()
        local pos = pointedthing.above

        if not minetest.is_protected(pos, playername) then
            onetime_waypoint:set_waypoint(playername, pos)
            minetest.chat_send_player(playername, "Waypoint set at "..minetest.pos_to_string(pos))
            itemstack:take_item()
            return itemstack
        end
    end,

    on_use = function(itemstack, pointer, pointedthing)
        local playername = pointer:get_player_name()
        local pos = onetime_waypoint:get_waypoint(playername)

        if pos then
            pointer:setpos(pos)
            minetest.chat_send_player(playername, "Waypoint dissolved!")

            onetime_waypoint:set_waypoint(playername)
            itemstack:take_item()
            return itemstack
        else
            minetest.chat_send_player(playername, "No waypoint set yet!")
        end
    end,
})
