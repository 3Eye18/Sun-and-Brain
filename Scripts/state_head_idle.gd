extends State


func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed('primary_shot'):
		state_machine.transition_to("Shooting")
