extends Area2D

var is_occupied = false
var occupied_with = "none"
@onready var item = $item

func _on_button_pressed():
	if is_occupied == true:
		if occupied_with == "electromagnet":
			ResourceManager.add_electromagnet()
		if occupied_with == "circuit_board":
			ResourceManager.add_circuitboard()
		is_occupied = false
		item.texture = null
