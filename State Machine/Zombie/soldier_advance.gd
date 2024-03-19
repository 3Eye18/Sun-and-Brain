extends State


func physics_update(delta: float) -> void:
	var direction = owner.player.global_position - owner.global_position
	var new_velocity = direction.normalized() * owner.speed
	owner.velocity = new_velocity
	owner.move_and_slide()

	if owner.player_in_shoot_range and not owner.player_in_retreat_range:
		state_machine.transition_to("Idle")
	elif owner.player_in_shoot_range and owner.player_in_retreat_range:
		state_machine.transition_to("Retreat")
