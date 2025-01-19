extends Area2D

@onready var crafting_ui = $"../../../../.."
@onready var output_slot = $"../../../../../output_slot"

func _on_button_pressed():
	if ResourceManager.iron_amount >= 1 and ResourceManager.battery_amount >= 1:
		if output_slot.is_occupied == false:
			crafting_ui.put_in_output("electromagnet")
			ResourceManager.iron_amount -= 1
			ResourceManager.battery_amount -= 1
			output_slot.is_occupied = true
			output_slot.occupied_with = "electromagnet"
		else:
			if output_slot.occupied_with == "circuit_board":
				crafting_ui.put_in_output("electromagnet")
				ResourceManager.carbonfiber_amount += 1
				ResourceManager.wire_amount += 1
				ResourceManager.iron_amount -= 1
				ResourceManager.battery_amount -= 1
				output_slot.is_occupied = true
				output_slot.occupied_with = "electromagnet"
		
