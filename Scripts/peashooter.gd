extends CharacterBody2D
class_name Peashooter

@export var pea_scene: PackedScene
@export var health: float = 100
@export var speed: float = 400
@export var max_bullet: float = 10

var bullet_count: float
var can_shoot: bool = true
var can_take_damage: bool = true
var mouse_direction


# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_count = max_bullet


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("primary_shot"):
		if bullet_count > 0:
			if can_shoot:
				shoot()
		else:
			reload()
	
	get_node("%Health Bar").value = health
	get_node("%Mag").text = str(bullet_count)
	mouse_direction = (get_global_mouse_position() - self.global_position).normalized()
	$Sprite2D.rotation = mouse_direction.angle()


func shoot():
	get_node("%Shoot delay").start()
	can_shoot = false
	bullet_count -= 1
	# Create a new instance of the Pea scene.
	var pea = pea_scene.instantiate()
	pea.global_position = get_node("%Marker2D").global_position
	pea.global_rotation = $Sprite2D.global_rotation
	# Spawn the pea by adding it to the Peashooter scene.
	add_child(pea)


func _on_shoot_delay_timeout():
	can_shoot = true


func reload():
	get_node("%Reload").start();


func _on_reload_timeout():
	bullet_count = max_bullet


func take_damage(attack: AttackComponent):
	if can_take_damage == true:
		can_take_damage = false
		get_node("%Iframe").start()
		health -= attack.damage_point


func _on_iframe_timeout():
	can_take_damage = true




