extends State


func physics_update(delta: float) -> void:
	owner.velocity = Vector2.ZERO

	if owner.player_in_shoot_range and owner.player_in_retreat_range:
		state_machine.transition_to("Retreat")
	elif not owner.player_in_shoot_range:
		state_machine.transition_to("Advance")
