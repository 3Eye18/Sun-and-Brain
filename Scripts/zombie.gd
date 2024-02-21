extends CharacterBody2D

var attack: AttackComponent
@export var damage_point: float = 10
@export var health: float = 100
@export var speed: float = 100
@onready var player = get_node("/root/Main/Leg")

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.value = health


func _process(delta):
	for body in $"Attack-box".get_overlapping_bodies():
		if body.is_in_group("Friendly"):
			attack = AttackComponent.new()
			attack.damage_point = damage_point
			body.take_damage(attack)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()


func take_damage(attack: AttackComponent):
	health -= attack.damage_point
	$ProgressBar.value = health
	if health <= 0:
		queue_free()


