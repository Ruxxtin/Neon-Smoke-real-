extends CanvasLayer

@onready var health_bar = $"MarginContainer/rows/top row/Health Bar"
@onready var current_iron = $"MarginContainer/rows/top row/current_iron"
@onready var current_battery = $"MarginContainer/rows/top row/current_battery"

var new_iron = 0
var new_battery = 0

func _physics_process(delta):
	current_iron.text = str(new_iron)
	current_battery.text = str(new_battery)


func set_new_health_value(new_health: int):
	pass


func set_current_iron(new_iron: int):
	pass
