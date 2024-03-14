extends State

var target
@onready var player = get_node("/root/Main/Game field/Leg")
@onready var agent = $"../../NavigationAgent2D"

func physics_update(delta: float) -> void:
	target = player.global_position
	update_target_position(target)
	
	var current_location = owner.global_position
	var next_location = agent.get_next_path_position()
	var new_velocity = (next_location- current_location).normalized() * owner.speed
	owner.velocity = new_velocity
	owner.move_and_slide()


func update_target_position(target):
	agent.set_target_position(target)
