extends Area2D

var touching_player = false

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/arcade_game_1.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		touching_player = true

func _on_body_exited(body):
	if body.name == "Player":
		touching_player = false
