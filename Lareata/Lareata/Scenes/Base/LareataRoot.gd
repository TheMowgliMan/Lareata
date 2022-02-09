extends Node2D

class_name LareataRoot

# Load stuff
var BasePlayer = load("Scenes/Base/BasePlayer.gd")
var BaseItem = load("Scenes/Base/BaseItem.gd")

# Variables
var world_map = []
var light_map = []
var inventory = []
var accessory_slots = []
var armor_slots = []
var map_width setget set_map_width, get_map_width
var map_height setget set_map_height, get_map_height
var map_generated = false;


# Signals
signal start_mapgen(map_width, map_height)


# Functions

# Setters/Getters
func set_inv(id, item):
	inventory[id] = item
	
func get_inv(id):
	return inventory[id]
	
func set_accessory(id, item):
	accessory_slots[id] = item
	
func get_accessory(id):
	return accessory_slots[id]
	
func set_armor(id, item):
	armor_slots[id] = item
	
func get_armor(id):
	return armor_slots[id]

func set_map_width(width):
	if !map_generated:
		map_width = width
		
func get_map_width():
	return map_width
	
func set_map_height(height):
	if !map_generated:
		map_height = height
		
func get_map_height():
	return map_height

# Map Access
func get_map(x, y):
	return world_map[(x * map_height) + y]
	
func get_mapV(pos):
	return world_map[(pos.x * map_height) + pos.y]
	
func set_map(x, y, tile):
	world_map[(x * map_height) + y] = tile
	
func set_mapV(pos, tile):
	world_map[(pos.x * map_height) + pos.y] = tile
	
func get_light_map(x, y):
	return light_map[(x * map_height) + y]
	
func get_light_mapV(pos):
	return light_map[(pos.x * map_height) + pos.y]
	
func set_light_map(x, y, tile):
	light_map[(x * map_height) + y] = tile
	
func set_light_mapV(pos, tile):
	light_map[(pos.x * map_height) + pos.y] = tile
	
func __mapgen_finished_sig(map):
	if len(map) == map_width * map_height:
		world_map = map
		
# Other
func get_controls(delta):
	var up_vel = 0
	var right_vel = 0
	var jumping = Input.is_action_pressed("ui_up")
	
	if Input.is_action_pressed("ui_up"):
		up_vel -= 1
	if Input.is_action_pressed("ui_down"):
		up_vel += 1
	if Input.is_action_pressed("ui_left"):
		right_vel -= 1
	if Input.is_action_pressed("ui_right"):
		right_vel += 1
		
	$BasePlayer.move(up_vel, right_vel, jumping, delta)
	
func equipped_accessory_update(player, delta):
	for item in accessory_slots:
		if item is BasePlayer:
			if item.accesory:
				player = item.accessory_tick(player, delta)
	return player
	
func item_inventory_tick(player, delta):
	for item in inventory:
		if item is BasePlayer:
			if item.accesory:
				player = item.accessory_tick(player, delta)
	return player

func _physics_process(delta):
	get_controls(delta)
	$BasePlayer.reset_variables()
	$BasePlayer.regenerate_life()
	
	equipped_accessory_update($BasePlayer, delta)
	item_inventory_tick($BasePlayer, delta)
	
func reset_inventory(inv, acc, armor):
	inventory = []
	for i in range(0, inv):
		inventory.append(false)
	accessory_slots = []
	for i in range(0, acc):
		accessory_slots.append(false)
	armor_slots = []
	for i in range(0, armor):
		armor_slots.append(false)
		
func _ready():
	reset_inventory(48, 5, 3)
