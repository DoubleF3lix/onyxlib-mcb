# onyxlib-mcb
A library for [mc-build](https://github.com/mc-build/mc-build) that implements functions from Onyx


## Usage
Simply extract `onyxlib.zip` from the releases tab straight into your `src` directory.

The library is split into 3 parts: `calc_xp_points`, `rng`, and `math`.
See below for a list of macros that this library provides:

* `calc_xp_points`
  Import with `import ./onyxlib/calc_xp_points`
  * `calc_xp_points` - (Usage: `macro calc_xp_points <targets>`. Output is stored in `<player_name> onyx.xp_points`.)
  
* `rng`
  Import with `import ./onyxlib/rng`
  * `rand_int` - (Usage: `macro rand_int min max`. Both `min` and `max` are inclusive. Output is stored in `$output onyx.rng`.)
  
* `math`
  Import with `import ./onyxlib/math`
  * `sin` - (Usage: `macro sin <theta>` or `macro sin <player> <objective>`. Output is stored in `$output onyx.math`.)
  * `cos` - (Usage: `macro cos <theta>` or `macro cos <player> <objective>`. Output is stored in `$output onyx.math`.)
  * `tan` - (Usage: `macro tan <theta>` or `macro tan <player> <objective>`. Output is stored in `$output onyx.math`.)
  * `pow` - (Usage: `macro pow <player> <objective> <exponnent>`. Output is stored in `$output onyx.math`.)
  * `sqrt` - (Usage: `macro sqrt <value>` or `macro sqrt <player> <objective>`. Output is stored in `$output onyx.math`.)
  * `NOT` - (Usage: `macro NOT <value>` or `macro NOT <player> <objective>`. Output is stored in `$output onyx.bitwise`)
  * `AND` - (Usage: `macro AND <player> <objective> <value>` or `macro AND <player> <objective> <player2> <objective2>`. Output is stored in `$output onyx.bitwise`)
  * `LEFT_SHIFT` - (Usage: `macro LEFT_SHIFT <player> <objective> <value>` or `macro LEFT_SHIFT <player> <objective> <player2> <objective2>`. Output is stored in `$output onyx.bitwise`)
  * `RIGHT_SHIFT` - (Usage: `macro RIGHT_SHIFT <player> <objective> <value>` or `macro RIGHT_SHIFT <player> <objective> <player2> <objective2>`. Output is stored in `$output onyx.bitwise`)
  * `OR` - (Usage: `macro OR <player> <objective> <value>` or `macro OR <player> <objective> <player2> <objective2>`. Output is stored in `$output onyx.bitwise`)
  * `XOR` - (Usage: `macro XOR <player> <objective> <value>` or `macro XOR <player> <objective> <player2> <objective2>`. Output is stored in `$output onyx.bitwise`)

For more information on output scale, input scale, etc., see the [onyx documentation](https://doublefelix.cf/onyx_docs/).

## Credits
* Nitro (Creator of mc-build)
* vdvman1 (Creator of Phi, used for the RNG and bitwise modules)
* Part Toon (Creator of the square root functions)
* Ancientkingg and SnaveSutit (Helped me learn mc-build)
