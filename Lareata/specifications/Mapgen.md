# Basic Map Generator
## Extends and Name
extends Node class_name BasicMapGenerator

## Variables (All variables have public getters and setters unless otherwise specified)
enum TILES (Contains data about various tile used by mapgen.)

## Signals
### map_generation_finished (array map)
Sends _map_ to a LareataRoot node to add it to a map.

## Functions (Getsets are omitted unless otherwise specified)
### generate_map (int map_width, int map_height)
Generates a new map.
### __generate_map_sig (int map_width, int map_height)
Should run _generate_map()_. Connect to the _start_mapgen_ signal from LareataRoot. 
