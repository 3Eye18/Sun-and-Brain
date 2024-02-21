extends State


func physics_update(delta: float) -> void:
	owner.can_shoot = false
	
	if owner.bullet_count > 0:
		owner.can_shoot = true
		state_machine.transition_to("Idle")
