extends Node2D

@onready var canvas_layer = $CanvasLayer

func _on_start_button_pressed():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/cryolab.tscn")


func _on_options_button_pressed():
	canvas_layer.visible = true


func _on_button_pressed():
	canvas_layer.visible = false
