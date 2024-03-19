extends State

@export var bullet_scene: PackedScene

func physics_update(delta: float) -> void:
	if owner.can_shoot and owner.player_entered_room:
		$"../../Timers/Attack cooldown".start()
		owner.can_shoot = false
		# Create a new instance of the Pea scene.
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $"../../Marker2D".global_position
		bullet.global_rotation = $"../../Marker2D".global_rotation
		# Spawn the pea by adding it to the Peashooter scene.
		add_child(bullet)
	
	if not owner.player_in_shoot_range:
		state_machine.transition_to("Idle")
