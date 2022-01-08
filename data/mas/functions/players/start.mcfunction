# START
#  Purpose:
#    Allows the player to attempt to start the game.
#  End Effect:
#    Starts the game if it's not in progress and there are the correct number of players, sends an error
#    message otherwise.
#  Called by:
#    player
#  Additional notes:
#    None

#ATTEMPT TO START
execute unless score #game_state mas.counters = #NO_GAME mas.enums run tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" The game is already in progress.","color":"red"}]
execute if score #game_state mas.counters = #NO_GAME mas.enums unless predicate mas:maps/players run tellraw @s ["",{"text":"[","bold":true,"color":"gray"},{"text":"MineAndSeek","bold":true,"color":"blue"},{"text":"]","bold":true,"color":"gray"},{"text":" This map does not support ","color":"red"},{"score":{"name":"#players","objective":"mas.counters"},"bold":true,"color":"dark_red"},{"text":" players.","color":"red"}]
execute if score #game_state mas.counters = #NO_GAME mas.enums if predicate mas:maps/players run function mas:game/state/start