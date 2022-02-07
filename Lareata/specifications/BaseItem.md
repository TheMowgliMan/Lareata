# Basic Lareata Item
## Extends and Name
extends Node class_name BaseItem

## Variables (All variables have public getters and setters unless otherwise specified)
- bool weapon
- string weapon_damage_class_name
- bool accesory
- bool tile
- int tile_id
- bool crafting_item
- string name
- string item_graphics
- bool armor
- string armor_graphics
- string accesory_graphics
- int damage
- int use_style
- ProjectileObject shoot
- int projectile_speed
- int shoot_every_x_uses

## Constructor
Should just run _set_stats_ and then _on_create_new_.

## Functions (Getsets are omitted unless otherwise specified)
### set_stats ()
Sets the item's stats. Overrided by other items; just needs to set _crafting_item_ to true and _name_ to "BaseItem".
### on_use (RootPlayer player)
Must return _player_, may otherwise be empty.
### accessory_tick (RootPlayer player, int delta)
Must return _player_, may otherwise be empty.
### on_create_new ()
May be empty.
### on_shoot_projectile (RootPlayer player)
Must return _player_, may otherwise be empty.
### inventory_tick (RootPlayer player)
Must return _player_, may otherwise be empty.
