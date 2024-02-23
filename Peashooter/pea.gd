extends Area2D

@export var splash_damage: float = 20
@export var damage_point: float = 20
@export var MAX_DISTANCE: float = 1200
@export var speed: float = 1200.0

var attack: AttackComponent
var splash: AttackComponent
var travelled_distance: float



func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > MAX_DISTANCE:
		queue_free()


func _on_body_entered(body):
	if body.has_method("take_damage") and body.is_in_group("Hostile"):
		attack = AttackComponent.new()
		attack.damage_point = damage_point
		body.take_damage(attack)
		
		for bodies in $"Splash damage area".get_overlapping_bodies():
			if bodies.is_in_group("Hostile"):
				splash = AttackComponent.new()
				splash.damage_point = splash_damage
				bodies.take_damage(splash)
		
		queue_free()
