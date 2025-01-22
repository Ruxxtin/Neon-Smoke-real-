extends Area2D

@onready var crafting_ui = $"../../../../.."
@onready var output_slot = $"../../../../../output_slot"


func _on_circuit_button_pressed():
	if ResourceManager.wire_amount >= 1 and ResourceManager.carbonfiber_amount >= 1:
		if output_slot.is_occupied == false:
			crafting_ui.put_in_output("circuit_board")
			ResourceManager.wire_amount -= 1
			ResourceManager.carbonfiber_amount -= 1
			output_slot.is_occupied = true
			output_slot.occupied_with = "circuit_board"
		else:
			if output_slot.occupied_with == "electromagnet":
				crafting_ui.put_in_output("circuit_board")
				ResourceManager.iron_amount += 1
				ResourceManager.battery_amount += 1
				ResourceManager.wire_amount -= 1
				ResourceManager.carbonfiber_amount -= 1
				output_slot.is_occupied = true
				output_slot.occupied_with = "circuit_board"
			
			if output_slot.occupied_with == "hoverboard":
				crafting_ui.put_in_output("circuit_board")
				ResourceManager.electormagnet_amount += 1
				ResourceManager.circuitboard_amount += 1
				ResourceManager.wire_amount -= 1
				ResourceManager.carbonfiber_amount -= 1
				output_slot.is_occupied = true
				output_slot.occupied_with = "circuit_board"
