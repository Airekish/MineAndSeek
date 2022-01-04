# JOIN
#  Purpose:
#    Joins a player to the game, either as a player or a spectator (depending on the game state).
#  End Effect:
#    Tags the player, sets their id, spawns their markers and sets their ids to match, then sends a 
#    success message.
#  Called by:
#    players/join
#  Additional notes:
#    Could potentially allow players to join alive during the locker phase.
#    The entity check for setting the ids of the markers is also used twice, so it could be turned into
#    its own function to optimize it. TODO (low): Return to this.

#ADD PLAYER TAG
tag @s add mas.player

#RESET DC CHECK
scoreboard players reset @s mas.joined

#JOINED PRE_GAME
#might later change this to allow joining during locker phase.
execute if score #game_state mas.counters = #PRE_GAME mas.enums run kill @s

#JOINED DURING GAME
execute if score #game_state mas.counters = #IN_GAME mas.enums run kill @s

#SET ID
scoreboard players operation @s mas.ids = #players mas.counters

#SPAWN PLAYER MARKERS
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["mas.idle_marker","mas.unclaimed","mas.entity"]}
summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["mas.border_marker","mas.unclaimed","mas.entity"]}
scoreboard players operation @e[type=minecraft:armor_stand,tag=mas.entity,tag=mas.unclaimed,limit=2] mas.ids = @s mas.ids
tag @e[type=minecraft:armor_stand,tag=mas.entity,tag=mas.unclaimed,limit=2] remove mas.unclaimed

#MESSAGE
tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" You have joined the game.","color":"green"}]