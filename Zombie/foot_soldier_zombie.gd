extends CharacterBody2D

var player_entered_room: bool = false
var player_in_shoot_range: bool = false
var player_in_retreat_range: bool = false
var can_shoot: bool = true
var target
var attack: AttackComponent

@onready var player = get_node("/root/Main/Game field/Leg")
@onready var agent = $NavigationAgent2D

@export var health: float = 80
@export var speed: float = 50


func _ready():
	$ProgressBar.value = health


func _process(delta):
	target = player.global_position
	update_target_position(target)
	
	$Marker2D.look_at(target)


func take_damage(attack: AttackComponent):
	health -= attack.damage_point
	$ProgressBar.value = health
	if health <= 0:
		queue_free()


func update_target_position(target):
	agent.set_target_position(target)


func _on_timer_timeout():
	can_shoot = true


func _on_shooting_range_body_entered(body):
	player_in_shoot_range = true


func _on_shooting_range_body_exited(body):
	player_in_shoot_range = false


func _on_retreat_range_body_entered(body):
	player_in_retreat_range = true


func _on_retreat_range_body_exited(body):
	player_in_retreat_range = false
