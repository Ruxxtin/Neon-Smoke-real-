extends CharacterBody2D

var can_move = false

func _ready():
	velocity.y = 50

func _physics_process(delta):
	if can_move == true:
		move_and_slide()
