extends State


func physics_update(delta: float) -> void:
	owner.velocity = Vector2.ZERO
	
	if owner.player_entered_room == true:
		state_machine.transition_to("Moving")

