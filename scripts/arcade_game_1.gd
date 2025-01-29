extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Global.last_building = "game"
		get_tree().change_scene_to_file("res://scenes/arcade_building.tscn")
