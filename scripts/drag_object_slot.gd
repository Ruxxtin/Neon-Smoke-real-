extends Area2D

var is_occupied = false
var object_holding = ""
var object_ref

func _process(delta):
	var areas = get_overlapping_bodies()
	
	for area in areas:
		if area.is_in_group("drag_object"):
			is_occupied = true
			object_ref = area
	
	if object_ref.
