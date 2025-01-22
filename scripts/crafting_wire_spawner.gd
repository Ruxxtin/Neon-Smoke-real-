extends Sprite2D

var wire_amount = ResourceManager.wire_amount
var touching_mouse = false
var able_to_spawn = true

@onready var label = $Label

@export var wire_scene = preload("res://scenes/drag_object_iron.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wire_amount = ResourceManager.wire_amount
	label.text = str(wire_amount)
	
	if Input.is_action_just_pressed("click") and wire_amount >= 1 and touching_mouse == true:
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
		ResourceManager.electormagnet_amount -= 1"
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("drag_object"):
		able_to_spawn = false


func _on_area_2d_area_exited(area):
	if area.is_in_group("drag_object"):
		able_to_spawn = true
