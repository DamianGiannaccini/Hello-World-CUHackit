extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -700.0
@export var projectile_speed = 100.0

var is_player_active = true

var projectile = load("res://Projectile.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and is_player_active:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction and is_player_active:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func attack():
	var new_projectile = projectile.instantiate()
	new_projectile.position = Vector2(position.x + 50, position.y)
	get_parent().add_child(new_projectile)
	
	
	new_projectile.velocity = Vector2(projectile_speed, 0)
	
func block():
	pass
