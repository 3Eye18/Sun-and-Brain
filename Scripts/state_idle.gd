# Idle.gd
extends PlayerState


func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed('move_up') \
	or Input.is_action_just_pressed('move_down') \
	or Input.is_action_just_pressed('move_left') \
	or Input.is_action_just_pressed('move_right'):
		state_machine.transition_to("Moving")
