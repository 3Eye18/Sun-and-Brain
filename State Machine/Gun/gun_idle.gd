extends State


func physics_update(delta: float) -> void:
	if owner.player_in_shoot_range:
		state_machine.transition_to("Shoot")
