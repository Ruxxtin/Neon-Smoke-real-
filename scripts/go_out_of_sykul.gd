extends Area2D

func _on_body_entered(body):
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	Global.last_building = "sykul"  # Name of this building
	if Global.start_cutscene_played == false:
		get_tree().change_scene_to_file("res://scenes/panning_cutscene.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
