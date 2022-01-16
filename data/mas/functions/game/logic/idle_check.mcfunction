# IDLE CHECK
#  Purpose:
#    Punishes players for AFKing in a single spot for too long or just jiggling back and forth to avoid penalty.
#  End Effect:
#    Increments the idle counter if in range of the player, teleports the marker to the player (while within map bounds)
#    and resets the idle counter otherwise.
#  Called by:
#    game/logic/marker_check
#  Additional notes:
#    The tether range is currently hardcoded as 5 as distance can't be compared to a score (our enum).
#    We need to check for mas.spectator tag even though spectators don't have idle markers, because abilities can also tag
#    players as mas.spectator (e.g. polymorph).
#    @s represents the marker, @p represents the player.

#WITHIN TETHER RANGE
execute if entity @s[distance=..5] if score @p[tag=!mas.spectator] mas.ids = @s mas.ids run scoreboard players add @p mas.counters 1

#OUTSIDE TETHER RANGE
execute unless entity @s[distance=..5] run scoreboard players set @p mas.counters 0
execute if score @p[predicate=mas:maps/in_bounds] mas.ids = @s mas.ids unless entity @s[distance=..5] run tp @s @p