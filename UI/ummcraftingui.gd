extends CanvasLayer

@onready var crafting_table = $"../crafting_table"


var electromagnet_path = load("res://scenes/remote_item.tscn")


func _physics_process(delta):
	if crafting_table.ui_is_open == true:
		visible = true
	elif crafting_table.ui_is_open == false:
		visible = false
	
func create_electromagnet(position):
	var new_electromagnet = electromagnet_path.instantiate()
	new_electromagnet.set_position(position)
	add_child(new_electromagnet)
