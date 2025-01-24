extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		Global.last_building = "outside"
		get_tree().change_scene_to_file("res://scenes/sykul_ground_floor.tscn")
