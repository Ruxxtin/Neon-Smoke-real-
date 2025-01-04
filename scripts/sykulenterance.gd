extends Area2D

func _on_body_entered(body):
	Global.last_building = "outside"
	get_tree().change_scene_to_file("res://scenes/sykul_g_floor.tscn")
