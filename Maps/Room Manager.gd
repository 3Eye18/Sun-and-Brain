extends Node

@export var zombies = []
@export var gates = []

# Called when the node enters the scene tree for the first time.
func _ready():
	zombies = $"../Zombies".get_children()
	gates = get_tree().get_nodes_in_group("Gate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zombies = $"../Zombies".get_children()
	if zombies.size() == 0 and $"../Gates".get_child_count() != 0:
		for gate in $"../Gates".get_children():
			gate.queue_free()


func _on_area_2d_body_entered(body):
	$"../Area2D".queue_free()
	for z in zombies:
		z.player_entered_room = true
