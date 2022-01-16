# DEATH
#  Purpose:
#    Handles the case where a Survivor has been killed. Executes as and at the player who died.
#  End Effect:
#    Plays the death effects, and turns the Survivor into a spectator.
#  Called by:
#    game/logic/tick
#  Additional notes:
#    We play the sounds at 1000 blocks to eliminate the stereo effect and make the sound mono.

#BLOOD EFFECT
particle minecraft:block minecraft:red_mushroom_block ~ ~1 ~ 0 0 0 1 50

#SOUND EFFECTS
playsound minecraft:entity.player.attack.crit master @a[team=mas.hunter] ~ ~1 ~ 2 0.7
playsound minecraft:block.end_gateway.spawn master @a[tag=mas.player] ~ 1000 ~ 100 1.4
execute at @a[team=mas.hunter] run playsound minecraft:entity.ravager.celebrate master @a[tag=mas.player] ~ ~1 ~ 0.2 1.3

#BECOME SPECTATOR
function mas:game/logic/spectate