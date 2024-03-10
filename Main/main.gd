extends Node

@export var zombie_scene: PackedScene

var build_mode = false
var build_valid = false
var build_location
var build_type

var map_node


# Called when the node enters the scene tree for the first time.
func _ready():
	map_node = $"Game field/Map1"
	for i in get_tree().get_nodes_in_group("build_button"):
		i.pressed.connect(initiate_build_mode(i.name))


# Called every frame. 'delta' is the elapsed time since the previous frame.  -71-40  -12-131
func _process(delta):
	pass


func _unhandled_input(event):
	pass


func initiate_build_mode(tower_type):
	pass


func update_tower_preview():
	pass


func cancel_build_mode():
	pass


func verify_and_build():
	pass


#func _on_top_timer_timeout():
	#var zombie = zombie_scene.instantiate()
	#var mob_spawn_location = $"Path/Top path/PathFollow2D"
	#mob_spawn_location.progress_ratio = randf()
	#zombie.position = mob_spawn_location.position
	#add_child(zombie)
#
#
#func _on_bot_timer_timeout():
	#var zombie = zombie_scene.instantiate()
	#var mob_spawn_location = $"Path/Bot path/PathFollow2D"
	#mob_spawn_location.progress_ratio = randf()
	#zombie.position = mob_spawn_location.position
	#add_child(zombie)
#
#
#func _on_left_timer_timeout():
	#var zombie = zombie_scene.instantiate()
	#var mob_spawn_location = $"Path/Left path/PathFollow2D"
	#mob_spawn_location.progress_ratio = randf()
	#zombie.position = mob_spawn_location.position
	#add_child(zombie)
#
#
#func _on_right_timer_timeout():
	#var zombie = zombie_scene.instantiate()
	#var mob_spawn_location = $"Path/Right path/PathFollow2D"
	#mob_spawn_location.progress_ratio = randf()
	#zombie.position = mob_spawn_location.position
	#add_child(zombie)
