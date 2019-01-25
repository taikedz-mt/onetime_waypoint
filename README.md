# Onetime Waypoints for Minetest

Onetime Waypoints allow players to teleport back to the last place they set one. Placing a waypoint item sets the waypoint; using a waypoint item takes you to the last set waypoint, but also detroys it - you need to place a new waypoint after using one.

A player can only have one active waypoint at any one time.

Recipe:

```
T = torch
C = core material

[ ] [T] [ ]
[ ] [C] [ ]
[T] [ ] [T]
```

## Settings

* `onetime_waypoint.core` - the itemstring for the core material (bu default, a copper ingot)
