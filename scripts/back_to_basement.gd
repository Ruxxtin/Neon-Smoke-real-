extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Global.last_building = "stairs_to_cryolab"
		get_tree().change_scene_to_file("res://scenes/cryolab.tscn")
