extends Timer

@export var zombie_scene = "res://Zombie/zombie.tscn"

func _on_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = get_parent().get_child(0)
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)
