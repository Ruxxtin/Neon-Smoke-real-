extends Area2D

@onready var crafting_ui = $"../../../.."

func _on_button_pressed():
	if ResourceManager.iron_amount >= 1 and ResourceManager.battery_amount >= 1:
		crafting_ui.put_in_output("electromagnet")
		
