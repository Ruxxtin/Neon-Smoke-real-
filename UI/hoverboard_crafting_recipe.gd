extends Area2D

@onready var crafting_ui = $"../../../../.."
@onready var output_slot = $"../../../../../output_slot"


func _on_hover_button_pressed():
	if ResourceManager.electormagnet_amount >= 1 and ResourceManager.circuitboard_amount >= 1:
		if output_slot.is_occupied == false:
			crafting_ui.put_in_output("hoverboard")
			ResourceManager.electormagnet_amount -= 1
			ResourceManager.circuitboard_amount -= 1
			output_slot.is_occupied = true
			output_slot.occupied_with = "hoverboard"
		else:
			if output_slot.occupied_with == "electromagnet":
				crafting_ui.put_in_output("hoverboard")
				ResourceManager.iron_amount += 1
				ResourceManager.battery_amount += 1
				ResourceManager.electormagnet_amount -= 1
				ResourceManager.circuitboard_amount -= 1
				output_slot.is_occupied = true
				output_slot.occupied_with = "hoverboard"
			
			if output_slot.occupied_with == "circuit_board":
				crafting_ui.put_in_output("hoverboard")
				ResourceManager.wire_amount += 1
				ResourceManager.carbonfiber_amount += 1
				ResourceManager.electormagnet_amount -= 1
				ResourceManager.circuitboard_amount -= 1
				output_slot.is_occupied = true
				output_slot.occupied_with = "hoverboard"
