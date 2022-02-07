# Lareata Root Class

## Extending and Name
extends Node2D
class_name LareataRoot

## Variables (All variables have getters and setters unless otherwise specified)
- array world_map no getset
- array light_map no getset
- array inventory
- array accessory_slots
- array armor_slots
- int map_width
- int map_height
- bool map_generated
- player root_player (Must be an object that extends BasePlayer, see BasePlayer.md)

## Signals
### start_mapgen (int map_width, int map_height)
Connect this signal to whatever mapgen node you're using to tell it to begin mapgen.

## Functions (Getsets are omitted unless otherwise specified)
### map_width setter (int value)
Sets _map_width_. Must check if map is already generated.
### map_height setter (int value)
Sets _map_height_. Must check if map is already generated.
### get_map (int x, int y)
Gets a tile from the world map at _(x, y)_.
### set_map (int x, int y, int tile)
Sets  a tile in the map to _tile_. Should verify if tile exists first.
### __mapgen_finished_sig (array map)
Sets _world_map_ to _map_. Should check if _len(map) == map_width * map_height_. Connect an output signal from the mapgen to this function.
### get_controls ()
Should get keyboard input and send it to root_player (e.g. _root_player.move(int up_vel, int down_vel, bool jump)_). Should ensure that the player is on the ground before sending the jump data.
### equipped_accessory_update (RootPlayer player, int delta)
Should run _.accessory_tick(RootPlayer player, int delta)_ on every accessory in the accessory slots, provided that there is an accessory in the slot. Then, it should return _player_.
### item_inventory_tick (RootPlayer player, int delta)
Should run _.inventory_tick(RootPlayer player, int delta)_ on every item in the inventory, provided that there is an item in the slot. Then, it should return _player_.
### __physics_process (float delta)
Should run _get_controls()_, _root_player.reset_variables()_, and _root_player.regenerate_life()_. Then, it should run _equipped_accessory_update (RootPlayer player, int delta)_ and _item_inventory_tick (RootPlayer player, int delta)_.
### reset_inventory (int length)
Deletes everything in the inventory, and then adds _length_ _false_'s to the inventory.
