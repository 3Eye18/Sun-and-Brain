extends Node2D
class_name HealthComponent

@export var MAX_HEALTH: float
var health: float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(damage_point):
	health -= damage_point
	if health <= 0:
		get_parent().queue_free()
