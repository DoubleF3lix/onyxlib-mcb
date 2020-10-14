function load {
    scoreboard objectives add onyx.math dummy
    scoreboard objectives add onyx.const dummy
    scoreboard objectives add onyx.bitwise dummy
    scoreboard players set $2 onyx.const 2
    scoreboard players set $-1 onyx.const -1
    scoreboard players set #scale_factor onyx.math 100
}

dir sin {
    function main {
        execute at @p align xz run summon armor_stand ~ ~ ~ {Tags:["trig"]}
        execute as @e[tag=trig] run function lib:math/sin/calc
    }

    function calc {
        execute store result entity @s Rotation[0] float 0.1 run scoreboard players get $input onyx.math
        execute positioned 0.0 0.0 0.0 rotated as @s rotated ~ 0 run tp @s ^ ^ ^-1
        execute store result score $output onyx.math run data get entity @s Pos[0] 10000
        kill @s
    }
}

dir cos {
    function main {
        execute at @p align xz run summon armor_stand ~ ~ ~ {Tags:["trig"]}
        execute as @e[tag=trig] run function lib:math/cos/calc
    }

    function calc {
        execute store result entity @s Rotation[0] float 0.1 run scoreboard players get $input onyx.math
        execute positioned 0.0 0.0 0.0 rotated as @s rotated ~ 0 run tp @s ^ ^ ^1
        execute store result score $output onyx.math run data get entity @s Pos[2] 10000
        kill @s
    }
}

dir tan {
    function main {
        function lib:math/cos/main
        scoreboard players operation #temp1 onyx.math = $output onyx.math
        function lib:math/sin/main
        scoreboard players operation $output onyx.math /= #temp1 onyx.math
    }
}

dir pow {
    function main {
        scoreboard players remove $exponent onyx.math 1
        scoreboard players operation $output onyx.math = $input onyx.math
        execute if score $exponent onyx.math matches ..1 run scoreboard players operation $output onyx.math = $input onyx.math
        execute unless score $exponent onyx.math matches ..1 run function lib:math/pow/add_exponent
    }

    function add_exponent {
        scoreboard players operation $output onyx.math *= $input onyx.math
        scoreboard players remove $exponent onyx.math 1
        execute if score $exponent onyx.math matches 1.. run function lib:math/pow/add_exponent
    }
}

dir sqrt {
    function main {
        scoreboard players set $output onyx.math 0
        scoreboard players set #increment onyx.math 32768
        scoreboard players operation $input onyx.math *= #scale_factor onyx.math
        function lib:math/sqrt/loop
        scoreboard players operation $input onyx.math /= #scale_factor onyx.math
    }

    function loop {
        scoreboard players operation #temp onyx.math = $output onyx.math
        scoreboard players operation #temp onyx.math += #increment onyx.math
        scoreboard players operation #temp onyx.math *= #temp onyx.math
        execute if score #temp onyx.math <= $input onyx.math run scoreboard players operation $output onyx.math += #increment onyx.math
        scoreboard players operation #increment onyx.math /= $2 onyx.const
        execute if score #increment onyx.math matches 1.. run function lib:math/sqrt/loop
    }
}

dir bitwise {
    dir not {
        function main {
            scoreboard players operation $output onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players add $output onyx.bitwise 1
            scoreboard players operation $output onyx.bitwise *= $-1 onyx.const
        }
    }

    dir and {
        function main {
            scoreboard players set $output onyx.bitwise 0
            scoreboard players operation #input_1 onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players operation #input_2 onyx.bitwise = $input_2 onyx.bitwise
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players set $output onyx.bitwise -2147483648
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 1073741824
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 536870912
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 268435456
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 134217728
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 67108864
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 33554432
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 16777216
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 8388608
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 4194304
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 2097152
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 1048576
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 524288
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 262144
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 131072
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 65536
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 32768
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 16384
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 8192
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 4096
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 2048
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 1024
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 512
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 256
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 128
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 64
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 32
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 16
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 8
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 4
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 2
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add $output onyx.bitwise 1
        }
    }

    dir left_shift {
        function main {
            scoreboard players operation $output onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players set $input onyx.math 2
            scoreboard players operation $exponent onyx.math = $input_2 onyx.bitwise
            scoreboard players remove $exponent onyx.math 1
            function lib:math/pow/main
            scoreboard players operation $output onyx.bitwise *= $output onyx.math
        }
    }

    dir right_shift {
        function main {
            scoreboard players operation $output onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players set $input onyx.math 2
            scoreboard players operation $exponent onyx.math = $input_2 onyx.bitwise
            scoreboard players remove $exponent onyx.math 1
            function lib:math/pow/main
            scoreboard players operation $output onyx.bitwise /= $output onyx.math
        }
    }

    dir or {
        function main {
            scoreboard players operation #input_1 onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players operation #input_2 onyx.bitwise = $input_2 onyx.bitwise
            scoreboard players operation $output onyx.bitwise = #input_1 onyx.bitwise
            scoreboard players operation $output onyx.bitwise += #input_2 onyx.bitwise
            scoreboard players reset #temp onyx.bitwise
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players set #temp onyx.bitwise -2147483648
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1073741824
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 536870912
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 268435456
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 134217728
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 67108864
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 33554432
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16777216
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8388608
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4194304
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2097152
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1048576
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 524288
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 262144
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 131072
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 65536
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 32768
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16384
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8192
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4096
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2048
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1024
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 512
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 256
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 128
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 64
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 32
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1
            scoreboard players operation $output onyx.bitwise -= #temp onyx.bitwise
        }
    }

    dir xor {
        function main {
            scoreboard players operation #input_1 onyx.bitwise = $input_1 onyx.bitwise
            scoreboard players operation #input_2 onyx.bitwise = $input_2 onyx.bitwise
            scoreboard players operation $output onyx.bitwise = #input_1 onyx.bitwise
            scoreboard players operation $output onyx.bitwise += #input_2 onyx.bitwise
            scoreboard players reset #temp onyx.bitwise
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players set #temp onyx.bitwise -2147483648
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1073741824
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 536870912
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 268435456
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 134217728
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 67108864
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 33554432
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16777216
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8388608
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4194304
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2097152
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1048576
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 524288
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 262144
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 131072
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 65536
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 32768
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16384
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8192
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4096
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2048
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1024
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 512
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 256
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 128
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 64
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 32
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 16
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 8
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 4
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 2
            scoreboard players operation #input_1 onyx.bitwise *= $2 onyx.const
            scoreboard players operation #input_2 onyx.bitwise *= $2 onyx.const
            execute if score #input_1 onyx.bitwise matches ..-1 if score #input_2 onyx.bitwise matches ..-1 run scoreboard players add #temp onyx.bitwise 1
            scoreboard players operation $output onyx.bitwise -= #temp onyx.bitwise
            scoreboard players operation $output onyx.bitwise -= #temp onyx.bitwise
        }
    }
}