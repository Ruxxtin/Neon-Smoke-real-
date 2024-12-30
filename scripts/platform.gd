extends StaticBody2D

var holding_item_already = false
var item_is_hovering

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false #if you dont want box to be invisible remove this
		#pass
	if item_is_hovering:
		if Input.is_action_just_released("click"):
			holding_item_already = true
			item_is_hovering = false

func _on_area_2d_body_entered(body):
	item_is_hovering = true

func _on_area_2d_body_exited(body):
	item_is_hovering = false
