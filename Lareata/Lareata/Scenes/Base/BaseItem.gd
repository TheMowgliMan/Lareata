extends Node

class_name BaseItem

# Basic Set Function
# func set_x(val):
# 	x = val

# Basic Get Function
# func get_x():
# 	return x

# Variables
var weapon
var weapon_damage_class_name
var accesory
var tile
var tile_id
var crafting_item
var item_name
var item_graphics
var armor
var armor_graphics
var accesory_graphics
var damage
var use_style
var shoot
var projectile_speed
var shoot_every_x_uses

# Constructor
func _init():
	set_stats()
	on_create_new()
	
func set_stats():
	crafting_item = true
	item_name = "BaseItem"
	
func on_create_new():
	pass
	
func on_use(player):
	return player
	
func accessory_tick(player, delta):
	return player
	
func on_shoot_projectile(player):
	return player
	
func inventory_tick(player, delta):
	return player
