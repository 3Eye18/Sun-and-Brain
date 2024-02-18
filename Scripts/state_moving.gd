# Run.gd
extends PlayerState


func physics_update(delta: float) -> void:
	# We move the run-specific input code to the state.
	# A good alternative would be to define a `get_input_direction()` function on the `Player.gd`
	# script to avoid duplicating these lines in every script.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	peashooter.velocity = direction * peashooter.speed
	peashooter.move_and_slide()

	if peashooter.velocity == Vector2.ZERO:
		state_machine.transition_to("Idle")
