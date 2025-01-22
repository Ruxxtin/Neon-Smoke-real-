extends Area2D

func _on_body_entered(body):
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/arcade_building.tscn")
