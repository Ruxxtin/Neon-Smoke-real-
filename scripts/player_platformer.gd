extends CharacterBody2D

const SPEED = 180.0
const JUMP_VELOCITY = -380.0
const GRAVITY = 1200
var coyote_time = false

@onready var coyote_timer = $CoyoteTimer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	# Coyote time
	if is_on_floor():
		coyote_timer.start()
		coyote_time = true
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_time == true):
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump"):
		if velocity.y < 0:
			velocity.y = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Max fall speed
	if velocity.y > 400:
		velocity.y = 400
	
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("glitch_portal_to_internal"):
		get_tree().change_scene_to_file("res://scenes/arcade_game_1_internal.tscn")
	if area.is_in_group("glitch_portal_to_rl"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_coyote_timer_timeout():
	coyote_time = false
