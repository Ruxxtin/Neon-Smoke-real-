extends Area2D

var touching_combining_area = false

var touching_battery = false
var touching_cursor = false

func _on_area_entered(area):
	if area.is_in_group("battery_craftable"):
		touching_battery = true
	if area.is_in_group("combining_area"):
		touching_combining_area = true

func _physics_process(delta):
	#dragging with mouse
	if touching_cursor:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			position = get_global_mouse_position()

func _on_mouse_entered():
	touching_cursor = true


func _on_mouse_exited():
	touching_cursor = false


func _on_area_exited(area):
	if area.is_in_group("battery_craftable"):
		touching_battery = false
	if area.is_in_group("combining_area"):
		touching_combining_area = false
