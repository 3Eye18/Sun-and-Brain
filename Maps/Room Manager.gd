extends Node

var zombies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	zombies = get_tree().get_nodes_in_group("Hostile")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	for z in zombies:
		z.player_entered = true
