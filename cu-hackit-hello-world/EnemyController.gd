extends CharacterBody2D

@export var target : Node2D
@export var projectile_speed := 200.0

var projectile = load("res://Projectile.tscn")

func timer_timeout() -> void:
	var dir = (target.global_position - global_position).normalized()
	var new_projectile = projectile.instantiate()
	
	new_projectile.position = global_position
	new_projectile.velocity = dir * projectile_speed
	new_projectile.projectile_owner = "Enemy"
	get_parent().add_child(new_projectile)
	
