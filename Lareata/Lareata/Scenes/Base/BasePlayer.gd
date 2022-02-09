extends KinematicBody2D


class_name BasePlayer

export var horizontal_speed = 3000
export var vertical_speed = 0
export var health = 100
export var health_max = 100
export var life_regen = 1
var defense
export var jump_speed = 600
var frame = 30
var velocity = Vector2.ZERO
export var gravity_mult = 3

# Functions
func move(up_vel, right_vel, jump, delta):
	velocity.x = 0
	velocity += Vector2(0, ProjectSettings.get_setting("physics/2d/default_gravity") * gravity_mult * delta)
	
	var jump_velocity
	if jump and is_on_floor():
		jump_velocity = jump_speed
	else:
		jump_velocity = 0
	
	velocity += Vector2(right_vel * horizontal_speed, up_vel * vertical_speed - jump_velocity)
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	frame += 1

func reset_variables():
	horizontal_speed = 90
	vertical_speed = 0
	health = 100
	health_max = 100
	life_regen = 1
	defense
	jump_speed = 270
	
func regenerate_life():
	if frame % 30 == 0 and health < health_max:
		health += life_regen
		if health > health_max:
			health = health_max
