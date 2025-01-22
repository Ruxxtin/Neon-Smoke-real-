extends Node2D




func _on_start_button_pressed():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/cryolab.tscn")
