extends CanvasLayer

@onready var current_iron = $current_iron
@onready var current_battery = $current_battery

var start_checking = false

func _physics_process(_delta):
	if start_checking == true:
		current_iron.text = str(ResourceManager.iron_amount)
		current_battery.text = str(ResourceManager.battery_amount)



func _on_timer_timeout():
	start_checking = true
