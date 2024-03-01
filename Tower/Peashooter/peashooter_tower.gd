extends StaticBody2D

@export var pea_scene: PackedScene
var can_shoot = true

func _process(delta):
	var bodies = $"Detection range".get_overlapping_bodies()
	for i in range(bodies.size()):
		if bodies[i].is_in_group("Hostile"):
			var target = bodies[i]
			$PeaHead.look_at(target.global_position)
			if can_shoot == true:
				$"Attack cooldown".start()
				can_shoot = false
				# Create a new instance of the Pea scene.
				var pea = pea_scene.instantiate()
				pea.global_position = $PeaHead/Marker2D.global_position
				pea.global_rotation = $PeaHead.global_rotation
				# Spawn the pea by adding it to the Peashooter scene.
				add_child(pea)
			break

func _on_attack_cooldown_timeout():
	can_shoot = true
