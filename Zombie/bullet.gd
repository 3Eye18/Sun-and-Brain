extends Area2D

@export var damage_point: float = 10
@export var MAX_DISTANCE: float = 1200
@export var speed: float = 1200.0

var attack: AttackComponent
var travelled_distance: float


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = -Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	if travelled_distance > MAX_DISTANCE:
		queue_free()


func _on_body_entered(body):
	if body.has_method("take_damage"):
		attack = AttackComponent.new()
		attack.damage_point = damage_point
		body.take_damage(attack)
	queue_free()
