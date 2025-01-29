extends AudioStreamPlayer2D

var previous_scene_path = ""

func _process(delta):
	# Check the current scene
	var current_scene = get_tree().current_scene
	if current_scene:
		# Use metadata or name for identification
		var current_scene_path = current_scene.get_scene_file_path() if current_scene.has_method("get_scene_file_path") else ""
		if current_scene_path != previous_scene_path:
			previous_scene_path = current_scene_path
			_on_scene_changed(current_scene_path)

func _on_scene_changed(scene_path):
	if scene_path == "res://scenes/panning_cutscene.tscn" or scene_path == "res://scenes/bridge_cutscene.tscn":
		if not is_playing():
			play()
	else:
		if is_playing():
			stop()
