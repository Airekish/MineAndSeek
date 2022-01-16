# SPECTATE
#  Purpose:
#    Turns a player into a spectator, because they died or joined mid-game.
#  End Effect:
#    Sets gamemode, adds the spectator tag, TP's to spectator spawn, shows message, dismisses their idling stuff, joins them to the team 
#    for spectators, resets their death/health scores, and joins the spectator team.
#  Called by:
#    game/logic/death, game/state/join
#  Additional notes:
#    We initially set the gamemode to make sure it's immediately set, even though tick_second would've caught it eventually.
#    Technically we don't need to delete idle marker for dead players since they get ignored (due to spectator tag), but its less entities
#    to match ids against. We don't kill the bounds marker so that spectators don't fly out of bounds.
#    We also don't need to leave the mas.survivor team as joining a new team automatically leaves any current team. The mas.spectator team 
#    has no real purpose other than to color the names of dead players, to differentiate them from regular players.

#SET GAMEMODE
gamemode spectator @s

#ADD SPECTATOR TAG
tag @s add mas.spectator

#TP TO SPECTATOR SPAWN
execute at @e[type=minecraft:marker,tag=mas.survivor_spawn,limit=1] run tp @s ~ ~30 ~ ~ 60

#SHOW SPECTATOR MESSAGE
title @s title ["",{"text":"SPECTATING","bold":true,"italic":true,"color":"white"}]

#DISMISS IDLING
execute as @e[type=minecraft:marker,tag=mas.idle_marker] if score @s mas.ids = @p mas.ids run kill @s
scoreboard players reset @s mas.counters

#RESET DEATHS/HEALTH
scoreboard players reset @s mas.death
scoreboard players reset @s mas.health

#JOIN SPECTATOR TEAM
team join mas.spectator