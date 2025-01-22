extends CanvasLayer

@onready var crafting_table = $"../crafting_table"
@onready var item = $output_slot/item

var resources = {
	"electromagnet": load("res://sprites/stuff_in_crafting_table/electromagnet.png"),
	"circuit_board": load("res://sprites/stuff_in_crafting_table/circuit board resource.png"),
	"hoverboard": load("res://sprites/stuff_in_crafting_table/hoverboard.png")
}


func _physics_process(delta):
	if crafting_table.ui_is_open == true:
		visible = true
	elif crafting_table.ui_is_open == false:
		visible = false
	
func put_in_output(resource_type):
	if resource_type == "electromagnet":
		item.texture = load("res://sprites/stuff_in_crafting_table/electromagnet.png")
	if resource_type == "circuit_board":
		item.texture = load("res://sprites/stuff_in_crafting_table/circuit board resource.png")
	if resource_type == "hoverboard":
		item.texture = load("res://sprites/stuff_in_crafting_table/hoverboard.png")
