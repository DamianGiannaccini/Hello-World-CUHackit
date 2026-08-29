extends CharacterBody2D

var projectile_owner : String

func _process(delta: float) -> void:
	move_and_slide()


func on_area_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		if projectile_owner != "Enemy":
			body.queue_free()
			queue_free()
	elif body.is_in_group("Damageable"):
		body.queue_free()
		queue_free()
	elif body.is_in_group("Environment"):
		queue_free()
