extends Node

@export var zombie_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.  -71-40  -12-131
func _process(delta):
	pass


#func _on_timer_timeout():
	#var zombie = zombie_scene.instantiate()
	#var mob_spawn_location = 
	#mob_spawn_location.progress_ratio = randf()
	#zombie.position = mob_spawn_location.position
	#add_child(zombie)


func _on_top_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = $"Path/Top path/PathFollow2D"
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)


func _on_bot_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = $"Path/Bot path/PathFollow2D"
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)


func _on_left_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = $"Path/Left path/PathFollow2D"
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)


func _on_right_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = $"Path/Right path/PathFollow2D"
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)
