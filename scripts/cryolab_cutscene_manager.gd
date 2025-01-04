extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.can_move = false
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "cryolab_cutscene")
