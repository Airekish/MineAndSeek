# XP TIMER
#  Purpose:
#    Keeps player XP levels equal to the seconds left in the locker phase or the minutes left in the round.
#  End Effect:
#    Removes one XP level and schedules itself to loop again in a second if in pregame and a minute if in game.
#  Called by:
#    game/state/start, then itself
#  Additional notes:
#    None.

#XP UPDATE
xp add @a[tag=mas.player] -1 levels

#LOOP EVERY SECOND IF IN PREGAME
execute if score #game_state mas.counters = #PRE_GAME mas.enums run schedule function mas:game/logic/xp_timer 1s

#LOOP EVERY MINUTE IF IN GAME
execute if score #game_state mas.counters = #IN_GAME mas.enums run schedule function mas:game/logic/xp_timer 60s