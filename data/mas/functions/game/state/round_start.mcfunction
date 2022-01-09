# ROUND START
#  Purpose:
#    Initiates the actual round phase of the game, in which Survivors hide and Hunters seek.
#  End Effect:
#    Updates the game state, sets the tablist health display, sets the regen for Hunters, and begins the
#    timers for the five minute mark and per-second round ticks.
#  Called by:
#    game/logic/spawn_hunters
#  Additional notes:
#    The tick_second function MUST be the first scheduled so that it takes priority.
#    XP timer is set to 11 instead of 10 to account for the immediate removal of one level after pregame.

#UPDATE GAME STATE
scoreboard players operation #game_state mas.counters = #IN_GAME mas.enums

#SETDISPLAY FOR HEALTH
scoreboard objectives setdisplay list mas.health

#XP INIT
xp set @a[tag=mas.player] 11 levels
title @a[tag=mas.player] actionbar "MINUTES TILL ROUND END:"

#HUNTER REGEN
effect give @a[team=mas.hunter] minecraft:regeneration 9999 127 true

#SCHEDULES
schedule function mas:game/logic/tick_second 1s
schedule function mas:game/logic/five_min_msg 300s