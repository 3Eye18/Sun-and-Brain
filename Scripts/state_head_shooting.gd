extends State

@export var pea_scene: PackedScene

func physics_update(delta: float) -> void:
	if owner.can_shoot == true:
		get_node("%Shoot delay").start()
		owner.can_shoot = false
		owner.bullet_count -= 1
		# Create a new instance of the Pea scene.
		var pea = pea_scene.instantiate()
		pea.global_position = get_node("%Marker2D").global_position
		pea.global_rotation = get_node("%Sprite2D").global_rotation
		# Spawn the pea by adding it to the Peashooter scene.
		owner.add_child(pea)
		
		if owner.bullet_count > 0:
			state_machine.transition_to("Idle")
		else:
			get_node("%Reload").start()
			state_machine.transition_to("Reloading")
		
		
