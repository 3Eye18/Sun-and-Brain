extends CharacterBody2D


var attack: AttackComponent
var player_entered_room: bool = false

@export var damage_point: float = 10
@export var health: float = 100
@export var speed: float = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.value = health


func _process(delta):
	for body in $"Attack area".get_overlapping_bodies():
		if body.has_method("take_damage"):
			attack = AttackComponent.new()
			attack.damage_point = damage_point
			body.take_damage(attack)


func take_damage(attack: AttackComponent):
	health -= attack.damage_point
	$ProgressBar.value = health
	if health <= 0:
		queue_free()
