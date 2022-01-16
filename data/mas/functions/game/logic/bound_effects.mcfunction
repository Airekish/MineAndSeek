# BOUND EFFECTS
#  Purpose:
#    Executes the bound effects required before and during the game.
#  End Effect:
#    TPs or kills all foreign entities within the map bounds.
#  Called by:
#    scripts/main, game/logic/tick_second
#  Additional notes:
#    As a temporary fix for the lightning effect, we exclude the lightning marker from the killing of out-of-bounds 
#    mas.entity, but we should really have a better method. TODO (high): Make a better lightning system.

#TP FOREIGN PLAYERS
tp @a[tag=!mas.player,predicate=mas:maps/in_bounds] 1.5 63 35.5 180 0

#KILL FOREIGN ENTITIES
kill @e[type=!minecraft:player,tag=!mas.entity,predicate=mas:maps/in_bounds]

#KILL ESCAPED MAS ENTITIES
kill @e[type=!minecraft:player,tag=mas.entity,tag=!mas.lightning,predicate=!mas:maps/in_bounds]