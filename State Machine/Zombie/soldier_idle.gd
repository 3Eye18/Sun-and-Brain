extends State


func physics_update(delta: float) -> void:
	owner.velocity = Vector2.ZERO
	$"../../Marker2D/Gun/Timers/Attack cooldown".wait_time = 0.5
	
	if owner.player_entered_room == true:
		if owner.player_in_shoot_range:
			if owner.player_in_retreat_range:
				state_machine.transition_to("Retreat")
		else:
			state_machine.transition_to("Advance")
