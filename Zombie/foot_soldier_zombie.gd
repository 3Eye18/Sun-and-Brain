extends CharacterBody2D

var attack: AttackComponent
var player_entered_room: bool = false
var player_in_range: bool = false
var can_shoot: bool = true

@export var bullet_scene: PackedScene
@export var target: PackedScene
@export var health: float = 80
@export var speed: float = 100

func _ready():
	$ProgressBar.value = health


func _process(delta):
	$Marker2D.look_at(-get_global_mouse_position())
	if can_shoot == true:
		$"Timers/Attack cooldown".start()
		can_shoot = false
		# Create a new instance of the Pea scene.
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $Marker2D/Gun/Marker2D.global_position
		bullet.global_rotation = $Marker2D/Gun/Marker2D.global_rotation
		# Spawn the pea by adding it to the Peashooter scene.
		add_child(bullet)


func take_damage(attack: AttackComponent):
	health -= attack.damage_point
	$ProgressBar.value = health
	if health <= 0:
		queue_free()


func _on_timer_timeout():
	can_shoot = true


func _on_shooting_range_body_entered(body):
	player_in_range = true
