extends Area2D

var dragging = false
var off = Vector2(0,0)
var dropable = false
var arearef
var in_slot = false
var in_return_slot = true
var slot_num = 0
var touching_other_drag = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var areas = get_overlapping_areas()
	
	for area in areas:
		if area.is_in_group("drag_object"):
			touching_other_drag = true
		else:
			touching_other_drag = false
	
	if dragging:
		position = get_global_mouse_position() #- off
		Global.crafting_dragging = true
	elif dragging == false:
		Global.crafting_dragging = false
	
	#if Input.is_action_just_released("click"):
	#	dragging == false
	
	#dropping into slot
	#if Input.is_action_just_released("click"):
	#	if dropable == true:
	#		position = arearef.global_position
	#		in_slot = true




func _on_area_entered(area):
	if area.is_in_group("drag_object"):
		dropable = false
	if area.is_in_group("drag_object_slot_1") or area.is_in_group("drag_object_slot_2"):
		if not area.is_in_group("drag_object"):
			dropable = true
			arearef = area
		if area.is_occupied == true:
			dropable = false
		elif area.is_occupied == false:
			dropable = true
		else:
			touching_other_drag = true
	if area.is_in_group("return_slot"):
		dropable = true
		arearef = area
		in_return_slot = true


func _on_area_exited(area):
	if area.is_in_group("drag_object_slot"):
		dropable = false
		in_return_slot = false


func _on_button_pressed():
	if dragging == false:
		dragging = true
		off = get_global_mouse_position() - global_position
		if in_slot == true:
			in_slot = false
	elif dragging == true:
		if dropable == true:
			if touching_other_drag == false:
				position = arearef.global_position
				in_slot = true
				dragging = false
				if arearef.is_in_group("drag_object_slot_1"):
					slot_num = 1
				if arearef.is_in_group("drag_object_slot_2"):
					slot_num = 2
