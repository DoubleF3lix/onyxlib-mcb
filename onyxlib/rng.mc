# Initialize
function load {
    scoreboard objectives add onyx.rng dummy
    scoreboard objectives add onyx.const dummy
    scoreboard players set $2 onyx.const 2
    scoreboard players set #multiplier onyx.rng 1103515245
    scoreboard players set #discard onyx.rng 16
    execute unless score #seed onyx.rng matches -2147483648.. run scoreboard players set #seed onyx.rng <%Math.floor(Math.random() * (2147483648 - -2147483648) + -2147483648)%>
}

# Load the functions
function main {
    # Make both ends inclusive instead of min-inclusive, max-exclusive
    scoreboard players add $max onyx.rng 1
    scoreboard players operation #range onyx.rng = $max onyx.rng
    scoreboard players operation #range onyx.rng -= $min onyx.rng
    execute if score #range onyx.rng matches ..-1 run function onyxlib:rng/wrap_around
    execute if score #range onyx.rng matches 0.. run function onyxlib:rng/normal_start
}

function wrap_around {
    function onyxlib:rng/lcg
    execute store success score $is_in_range onyx.rng if score $output onyx.rng < $min onyx.rng
    execute if score $is_in_range onyx.rng matches 0 store success score $is_in_range onyx.rng if score $output onyx.rng > $max onyx.rng
    execute unless score $is_in_range onyx.rng matches 0 run function onyxlib:rng/wrap_around
}

function lcg {
    function onyxlib:rng/lcg_raw
    scoreboard players operation $output onyx.rng /= #discard onyx.rng
}

function lcg_raw {
    scoreboard players operation #seed onyx.rng *= #multiplier onyx.rng
    scoreboard players add #seed onyx.rng 12345
    scoreboard players operation $output onyx.rng = #seed onyx.rng
}

function normal_start {
    scoreboard players operation #temp onyx.rng = #range onyx.rng
    scoreboard players remove #temp onyx.rng 1
    function onyxlib:rng/normal
    scoreboard players operation $output onyx.rng += $min onyx.rng
}

function normal {
    function onyxlib:rng/lcg_raw
    execute if score $output onyx.rng matches 0.. run scoreboard players operation $output onyx.rng /= $2 onyx.const
    execute if score $output onyx.rng matches ..-1 run function onyxlib:rng/shift_right
    scoreboard players operation $output onyx.rng /= #discard onyx.rng
    scoreboard players operation #temp1 onyx.rng = $output onyx.rng
    scoreboard players operation $output onyx.rng %= #range onyx.rng
    scoreboard players operation #temp1 oynx.rng -= $output onyx.rng
    scoreboard players operation #temp1 onyx.rng += #temp onyx.rng
    execute if score #temp1 onyx.rng matches ..-1 run function onyxlib:rng/normal
}

function shift_right {
    scoreboard players add $output onyx.rng 2147483647
    scoreboard players add $output onyx.rng 1
    scoreboard players operation $output onyx.rng /= $2 onyx.const
    scoreboard players add $output onyx.rng 1073741824
}