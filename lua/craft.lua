local core_material = minetest.settings:get("onetime_waypoint.core") or "default:copper_ingot"

minetest.register_craft({
    output = "onetime_waypoint:waypoint",
    recipe = {
        {"", "default:torch", ""},
        {"", core_material, ""},
        {"default:torch", "", "default:torch"},
    }
})
