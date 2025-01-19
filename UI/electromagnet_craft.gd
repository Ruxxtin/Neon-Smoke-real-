extends Area2D

@onready var crafting_ui = $"../../../.."
@onready var output_slot = $"../../../../output_slot"

func _on_button_pressed():
	if ResourceManager.iron_amount >= 1 and ResourceManager.battery_amount >= 1:
		crafting_ui.put_in_output("electromagnet")
		ResourceManager.iron_amount -= 1
		ResourceManager.battery_amount -= 1
		output_slot.occupied_with = "electromagnet"
		
