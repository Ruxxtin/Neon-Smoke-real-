extends CharacterBody2D

var can_move = true

func _physics_process(delta):
	if can_move == true:
		move_and_slide()
