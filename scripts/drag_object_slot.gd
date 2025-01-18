extends Area2D

var is_occupied = false
var object_holding = ""
var object_ref
var is_drag_object = false

func _process(delta):
	var areas = get_overlapping_areas()
	
	for area in areas:
		if area.is_in_group("drag_object"):
			is_drag_object = true
			object_ref = area
		else:
			is_drag_object = false
	
	if is_drag_object == true:
		if object_ref.in_slot == true:
			is_occupied = true
			print("is true")
		elif object_ref.in_slot == false:
			is_occupied = false
			print("is false")
