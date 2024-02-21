extends CharacterBody2D
class_name PeashooterHead

@export var max_bullet: float = 10

var bullet_count: float
var can_shoot: bool = true


func _ready():
	bullet_count = max_bullet
	$"Bullet number".text = str(bullet_count)


func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	var mouse_direction = (mouse_position - self.global_position).normalized()
	$Sprite2D.global_rotation = mouse_direction.angle()
	if mouse_position.x > global_position.x:
		$Sprite2D.flip_v = false
	else:
		$Sprite2D.flip_v = true
	$"Bullet number".text = str(bullet_count)


func _on_shoot_delay_timeout():
	can_shoot = true


func _on_reload_timeout():
	can_shoot = true
	bullet_count = max_bullet
	
	
