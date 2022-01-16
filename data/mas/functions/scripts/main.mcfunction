# MAIN
#  Purpose:
#    Executes every tick, regardless of game state.
#  End Effect:
#    Runs bound effects for the pregame, executes the tickwise functions for in-game commands, clears the health
#    display for non-players, and keeps track of the player count.
#  Called by:
#    minecraft
#  Additional notes:
#    We need to clear the health display to only allow Survivor health to show up. Also, player counting
#    only really needs to happen during NO_GAME, so it may be more efficient to add an execute condition.
#    The health display clearing and player counting could probably be done every second instead.
#    TODO (medium): Return to this.

#PRE_GAME
execute if score #game_state mas.counters = #PRE_GAME mas.enums run function mas:game/logic/bound_effects

#IN_GAME
execute if score #game_state mas.counters = #IN_GAME mas.enums run function mas:game/logic/tick

#CLEAR HEALTH DISPLAY
execute as @a[team=!mas.survivor] run scoreboard players reset @s mas.health

#PLAYER COUNT
scoreboard players set #players mas.counters 0
execute as @a[tag=mas.player] run scoreboard players add #players mas.counters 1