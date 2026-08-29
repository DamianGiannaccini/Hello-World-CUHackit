extends Node2D


func on_area_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.damage()
