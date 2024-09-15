extends CharacterBody2D

@onready var interaction_thing = $"../Interaction_thing"
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_object = $"../collision object"

var can_move = true
var speed = 125.0
const JUMP_VELOCITY = -400.0
var sprinting = false

var resource_amount_iron = 0
var resource_amount_battery = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Sprinting
	if Input.is_action_pressed("sprint"):
		speed = 120
		sprinting = true
	else:
		speed = 85
		sprinting = false
	
	if can_move == true:
	# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var xdirection = Input.get_axis("move_left", "move_right")
		if xdirection:
			velocity.x = xdirection * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			
		var ydirection = Input.get_axis("move_up", "move_down")
		if ydirection:
			velocity.y = ydirection * speed
		else:
			velocity.y = move_toward(velocity.y, 0, speed)
	else:
		velocity.x = 0
		velocity.y = 0
	
	#if interaction_thing.player_cant_move == true:
	#	velocity.y = 0
	#	velocity.x = 0
	
	# Sprite Changes
	if velocity.y > 0:
		animated_sprite_2d.play("walk_forward")
	elif velocity.x > 0:
		animated_sprite_2d.play("walk_side")
		animated_sprite_2d.flip_h = false
	elif velocity.x < 0:
		animated_sprite_2d.play("walk_side")
		animated_sprite_2d.flip_h = true
	elif velocity.x == 0 and velocity.y == 0:
		animated_sprite_2d.play("idle")
	
	
	 
	velocity = velocity.normalized() * speed
	move_and_slide()


func _on_collision_object_body_entered(body):
	velocity.y = 0
	velocity.x = 0
