extends Node2D

@onready var platform = $"../platform"

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var other_item_already_there = false
var is_in_box = false

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset #you can remove offset if you want the item to auto center in cursor or whatever
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				if body_ref.holding_item_already and is_inside_dropable:
					is_in_box = true
					tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
				
			else:
				is_in_box = false
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)
	if is_in_box:
		platform.collision_mask = 10
		platform.collision_layer = 10
	else:
		platform.collision_mask = 1
		platform.collision_layer = 1
		

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)

func _on_area_2d_body_entered(body):
		if body.is_in_group('dropable'):
			print("huhuhuhuhuhuhuhhuhuhuhuhuhuhuhuhuhuhuhuhuhuhuhuhuhuhu")
			is_inside_dropable = true
			body.modulate = Color(Color.REBECCA_PURPLE, 1)
			body_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
