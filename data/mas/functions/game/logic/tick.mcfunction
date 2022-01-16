# TICK
#  Purpose:
#    Executes round-specific functionality that MUST be ran per tick.
#  End Effect:
#    Kills all foreign entities within the map bounds and checks for player deaths.
#  Called by:
#    scripts/main
#  Additional notes:
#    Need to check death tickwise for death effects and spectator tp to work properly.
#    We check for !mas.hunter instead of mas.survivor so that people who join mid-game are 
#    turned into spectators.

#BOUND EFFECTS
function mas:game/logic/bound_effects

#DEATH CHECK
execute as @a[team=!mas.hunter,scores={mas.death=1..}] at @s run function mas:game/logic/death