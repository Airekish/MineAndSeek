# ONE MINUTE MESSAGE
#  Purpose:
#    Informs the players that the 9 minute mark has been reached and sets up the timer for the Survivor win condition.
#  End Effect:
#    Messages a title and subtitle to each player, schedules the Survivor win condition.
#  Called by:
#    game/state/round_start
#  Additional notes:
#    Using the scheduling method, this function is essential as it stretches the round duration.

#DISPLAY TEXT
title @a[tag=mas.player] title ["",{"text":"1 MIN LEFT","bold":true,"italic":false,"color":"white"}]
title @a[team=mas.hunter] subtitle ["",{"text":"Hurry! Dont let them escape!","bold":true,"italic":false,"color":"red"}]
title @a[team=mas.survivor] subtitle ["",{"text":"Hang in there!","bold":true,"italic":false,"color":"blue"}]

#SCHEDULE SURVIVOR WIN
schedule function mas:game/logic/win_survivors 60s