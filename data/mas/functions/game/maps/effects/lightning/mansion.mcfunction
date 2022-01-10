# LIGHTNING: MANSION
#  Purpose:
#    Scramble the lightning marker using the Mansion boundaries.
#  End Effect:
#    Spawns the marker randomly in a radius, then loops itself until the marker position is within
#    the map's boundaries.
#  Called by:
#    game/maps/effects/lightning, then itself
#  Additional notes:
#    Using the predicate directly in the selector for the schedule condition may be more efficient. Also,
#    we use max(x2-x1,z2-z1)/2 to determine spreadplayers distance, because spreadplayers works as a square.
#    There may be a better way to do this using scoreboard rng, since that wouldnt risk the marker going out 
#    of bounds. TODO (medium): Explore this.

#RANDOMIZE MARKER
spreadplayers 23 91 0 36 false @e[type=minecraft:marker,tag=mas.lightning,limit=1]
execute as @e[type=minecraft:marker,tag=mas.lightning,limit=1] unless predicate mas:maps/mansion/in_bounds run schedule function mas:game/maps/effects/lightning/mansion 1t