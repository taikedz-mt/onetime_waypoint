local function particle_effects(pos, colour)
    local radius = 2
    minetest.add_particlespawner({
            amount = 80,
            time = 1,
            minpos = {x=pos.x-radius/2, y=pos.y-radius/2, z=pos.z-radius/2}, 
            maxpos = {x=pos.x+radius/2, y=pos.y+radius/2, z=pos.z+radius/2}, 
            minlevel = {x=-0, y=-0, z=-0}, 
            maxlevel = {x=1, y=1, z=1}, 
            minacc = {x=-0.5,y=5,z=-0.5}, 
            maxacc = {x=0.5,y=5,z=0.5}, 
            minexptime = 0.1, 
            maxexptime = 1, 
            minsieze = 3,
            maxsieze = 4,
            collisiondetection = false,
            texture = "tnt_smoke.png^[colorize:"..colour..":80:100"
    })
end

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
            particle_effects(pos, "purple")
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
            particle_effects(pos, "red")

            onetime_waypoint:set_waypoint(playername)
            itemstack:take_item()
            return itemstack
        else
            minetest.chat_send_player(playername, "No waypoint set yet!")
        end
    end,
})
