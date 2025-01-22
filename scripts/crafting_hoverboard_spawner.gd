extends Sprite2D

var hoverboard_amount = ResourceManager.hoverboard_amount
var touching_mouse = false
var able_to_spawn = true

@onready var label = $Label

@export var hoverboard = preload("res://scenes/drag_object_electomagnet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hoverboard_amount = ResourceManager.hoverboard_amount
	label.text = str(hoverboard_amount)
	
	if Input.is_action_just_pressed("click") and hoverboard_amount >= 1 and touching_mouse == true:
		if able_to_spawn:
			spawn()
	
	if Global.crafting_dragging == true:
		able_to_spawn = false
	elif Global.crafting_dragging == false:
		able_to_spawn = true

func _on_area_2d_mouse_entered():
	touching_mouse = true


func _on_area_2d_mouse_exited():
	touching_mouse = false

func spawn():
	"if touching_mouse == true:
		var inst = electromagnet_scene.instantiate()
		owner.add_child(inst)
		inst.position = position
		touching_mouse = false
		ResourceManager.circuitboard_amount -= 1"
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("drag_object"):
		able_to_spawn = false


func _on_area_2d_area_exited(area):
	if area.is_in_group("drag_object"):
		able_to_spawn = true
