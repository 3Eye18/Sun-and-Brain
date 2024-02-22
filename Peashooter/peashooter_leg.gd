extends CharacterBody2D
class_name PeashooterLeg

@export var health: float = 100
@export var speed: float = 400

var can_take_damage: bool = true


func _physics_process(delta):
	$Health.value = health


func take_damage(attack: AttackComponent):
	if can_take_damage == true:
		can_take_damage = false
		get_node("%Iframe").start()
		health -= attack.damage_point


func _on_iframe_timeout():
	can_take_damage = true
