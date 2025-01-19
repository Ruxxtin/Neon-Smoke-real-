extends Area2D

var is_occupied = false
var object_holding = "none"
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
			object_holding = "none"
	
	if is_drag_object == true:
		if object_ref.in_slot == true:
			is_occupied = true
		elif object_ref.in_slot == false:
			is_occupied = false
			object_holding = "none"
	
	if is_occupied == true:
		if object_ref.is_in_group("drag_iron") and object_ref.slot_num == 2:
			object_holding = "iron"
		if object_ref.is_in_group("drag_battery") and object_ref.slot_num == 2:
			object_holding = "battery"
		GlobalCrafting.slot_two_item = object_holding
	else:
		GlobalCrafting.slot_two_item = "none"
	
