# TICK
#  Purpose:
#    Executes round-specific functionality that MUST be ran per tick.
#  End Effect:
#    Kills all foreign entities within the map bounds.
#  Called by:
#    scripts/main
#  Additional notes:
#    Clearing XP points is better than killing @e[...] tickwise, so we do that instead. If item
#    pickup ends up being an issue, replace the XP clearing with the entity killing line from
#    tick_second. TODO (low): Return to this.

#CLEAR XP POINTS
xp set @a[tag=mas.player] 0 points