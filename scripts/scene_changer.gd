extends Area2D

func _on_body_entered(body):
	if body.name == "Player":  # Check if the player triggered the event
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		Global.last_building = "basement"  # Name of this building
		if Global.start_cutscene_played == false:
			get_tree().change_scene_to_file("res://scenes/sykul_g_floor_cutscene.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/sykul_ground_floor.tscn")
