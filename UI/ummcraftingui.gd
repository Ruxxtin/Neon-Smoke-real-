extends CanvasLayer

@onready var crafting_table = $"../crafting_table"

var resources = {
	"electromagnet": preload("res://sprites/stuff_in_crafting_table/electromagnet.png"),
	"circuit_board": preload("res://scenes/drag_object_battery.tscn")
}

var electromagnet_path = load("res://scenes/remote_item.tscn")


func _physics_process(delta):
	if crafting_table.ui_is_open == true:
		visible = true
	elif crafting_table.ui_is_open == false:
		visible = false
	
func put_in_output(resource_type):
	if resources.has(resource_type):
		var resource_inst = resources[resource_type].instantiate()
		add_child(resource_inst)
		if resource_inst is Node2D:
			resource_inst.position = Vector2(85,2)
