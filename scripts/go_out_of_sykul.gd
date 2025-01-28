extends Area2D

func _on_body_entered(body):
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	Global.last_building = "sykul"  # Name of this building
	get_tree().change_scene_to_file("res://scenes/panning_cutscene.tscn")
