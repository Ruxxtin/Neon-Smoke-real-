extends Area2D

func _on_body_entered(body):
	if body.name == "Player":  # Check if the player triggered the event
		Global.last_building = "arcade"  # Name of this building
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/game.tscn")
