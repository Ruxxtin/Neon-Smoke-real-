extends StaticBody2D

var hovering = false

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false
	#if hovering == true:
	#	if Input.is_action_just_released("click"):
	#		add_to_group('occupied')
	#		remove_from_group('dropable')
	#		hovering = false
	

func _on_area_2d_body_entered(body):
	hovering = true

func _on_area_2d_body_exited(body):
	hovering = false
