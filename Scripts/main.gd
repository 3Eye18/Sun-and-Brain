extends Node

@export var zombie_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.  -71-40  -12-131
func _process(delta):
	pass


func _on_mob_timer_timeout():
	var zombie = zombie_scene.instantiate()
	var mob_spawn_location = get_node("%MobSpawnPathFollow")
	mob_spawn_location.progress_ratio = randf()
	zombie.position = mob_spawn_location.position
	add_child(zombie)
