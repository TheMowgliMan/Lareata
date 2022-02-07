# Basic Lareata Player
## Extends and Name
extends KinematicBody2D class_name BasePlayer

## Variables (All variables have public getters and setters unless otherwise specified)
- int horizontal_speed
- int vertical_speed
- int health
- int health_max
- int life_regen
- int defense
- int jump_speed

## Functions (Getsets are omitted unless otherwise specified)
### move (int up_vel, int right_vel, bool jump, int delta)
_move_and_slide()_'s the player. Multiply _up_vel_ by _vertical_speed_, _right_vel_ by _horizontal_speed_, and _jump_ (casted to int) by _jump_speed_. Add the delta value from physics_process to this.
- Note: _up_vel_ and _right_vel_ should be in the range from -1 to 1
### reset_variables ()
Resets _horizontal_speed_, _vertical_speed_, _jump_speed_, _defense_, _life_regen_ and _health_max_ to default values.
### regenerate_life ()
Increases _health_ by _life_regen_.
