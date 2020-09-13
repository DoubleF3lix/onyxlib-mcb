function load {
    scoreboard objectives add onyx.xp_points dummy
    scoreboard players set $6 onyx.const 6
    scoreboard players set $10 onyx.const 10
    scoreboard players set $25 onyx.const 25
    scoreboard players set $45 onyx.const 4
    scoreboard players set $360 onyx.const 360
    scoreboard players set $405 onyx.const 405
    scoreboard players set $1625 onyx.const 1625
    scoreboard players set $2200 onyx.const 2200
}

function main {
    execute store result score #current_points onyx.xp_points run experience query @s[type=player] points
    execute store result score #current_levels onyx.xp_points run experience query @s[type=player] levels
    execute store result score #temp1 onyx.xp_points run experience query @s[type=player] levels
    execute store result score #temp2 onyx.xp_points run experience query @s[type=player] levels
    execute if score #current_levels onyx.xp_points matches ..16 run function onyxlib:calc_xp_points/below16
    execute if score #current_levels onyx.xp_points matches 17..31 run function onyxlib:calc_xp_points/17to31
    execute if score #current_levels onyx.xp_points matches 32.. run function onyxlib:calc_xp_points/above32
    scoreboard players operation #temp1 onyx.xp_points += #current_points onyx.xp_points
    scoreboard players operation @s[type=player] onyx.xp_points = #temp1 onyx.xp_points
}

function below16 {
    execute if score #current_levels onyx.xp_points matches ..16 run scoreboard players operation #temp1 onyx.xp_points *= #temp1 onyx.xp_points
    execute if score #current_levels onyx.xp_points matches ..16 run scoreboard players operation #temp2 onyx.xp_points *= $6 onyx.const
    execute if score #current_levels onyx.xp_points matches ..16 run scoreboard players operation #temp1 onyx.xp_points += #temp2 onyx.xp_points
}

function 17to31 {
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp1 onyx.xp_points *= #temp1 onyx.xp_points 
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp1 onyx.xp_points *= $25 onyx.const
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp1 onyx.xp_points /= $10 onyx.const
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp2 onyx.xp_points *= $405 onyx.const
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp2 onyx.xp_points /= $10 onyx.const
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp1 onyx.xp_points -= #temp2 onyx.xp_points
    execute if score #current_levels onyx.xp_points matches 17..31 run scoreboard players operation #temp1 onyx.xp_points += $360 onyx.const
}

function above32 {
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp1 onyx.xp_points *= #temp1 onyx.xp_points
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp1 onyx.xp_points *= $45 onyx.const
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp1 onyx.xp_points /= $10 onyx.const
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp2 onyx.xp_points *= $1625 onyx.const
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp2 onyx.xp_points /= $10 onyx.const
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp1 onyx.xp_points -= #temp2 onyx.xp_points
    execute if score #current_levels onyx.xp_points matches 32.. run scoreboard players operation #temp1 onyx.xp_points += $2220 onyx.const
}