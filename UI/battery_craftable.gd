extends Area2D

var touching_cursor = false

func _physics_process(delta):
	#dragging with mouse
	if touching_cursor:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			position = get_global_mouse_position()

func _on_mouse_entered():
	touching_cursor = true


func _on_mouse_exited():
	touching_cursor = false
