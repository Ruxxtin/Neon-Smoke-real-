extends Area2D

var touching_player = false
var ui_is_open = false

@onready var player = $"../Player"



func _on_body_entered(body: CharacterBody2D):
	touching_player = true

func _on_body_exited(body: CharacterBody2D):
	touching_player = false

func _physics_process(delta):
	if touching_player == true:
		if Input.is_action_just_pressed("interact"):
			if ui_is_open == false:
				ui_is_open = true
				player.can_move = false
			elif ui_is_open == true:
				ui_is_open = false
				player.can_move = true
	
