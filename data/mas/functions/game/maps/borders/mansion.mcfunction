# BORDERS: MANSION
#  Purpose:
#    Prevents foreign players and entities from entering the map during a game, and prevents game 
#    players and entities from leaving, using the Mansion boundaries.
#  End Effect:
#    TP's foreign players to the lobby, kills foreign entities entering or game entities leaving,
#    and uses the markers/farm function to keep game players in bounds.
#  Called by:
#    game/maps/mansion, then itself
#  Additional notes:
#    The schedule condition is a bit redundant if we loop per second anyway since we already have
#    tick_seconds, but its equally redundant to check the map id in tick_seconds when we already do
#    that during map setup. At least this way, all map enum checks stay within the map files (making
#    it easier to add more maps in the future).
#    It may be possible to merge the border checks using predicate alternatives, though I'm not sure of
#    the performance impact. TODO (medium): Explore this.


#DISALLOW PLAYER ENTRY
tp @a[tag=!mas.player,predicate=mas:maps/in_mansion_range] 1.5 63 35.5 180 0

#DISALLOW PLAYER EXIT
execute at @a[tag=mas.player] as @e[type=minecraft:armor_stand,tag=mas.border_marker,scores={mas.id=0..}] if score @p mas.id = @s mas.id run function mas:game/maps/borders/markers/mansion

#DISALLOW ENTITY ENTRY
kill @e[type=!minecraft:player,tag=!mas.entity,predicate=mas:maps/in_mansion_range]

#DISALLOW ENTITY EXIT
kill @e[type=!minecraft:player,tag=mas.entity,predicate=!mas:maps/in_mansion_range]

#LOOP EVERY SECOND
schedule function mas:game/maps/borders/mansion 1s