extends CanvasLayer

@onready var current_iron = $"iron ui/current_iron"
@onready var current_battery = $"battery ui/current_battery"
@onready var current_carbonfiber = $"carbonfiber ui/current_carbonfiber"
@onready var current_wire = $"wire ui/current_wire"
@onready var current_electromagnet = $"wire ui/electromagnet ui/current_electromagnet"
@onready var current_circuitboard = $"circuitboard ui/current_circuitboard"
@onready var current_hoverboard = $"hoverboard ui/current_hoverboard"
@onready var timer = $Timer

var current_scene = null

func _physics_process(_delta):
	#if start_checking == true:
	current_iron.text = str(ResourceManager.iron_amount)
	current_battery.text = str(ResourceManager.battery_amount)
	current_wire.text = str(ResourceManager.wire_amount)
	current_carbonfiber.text = str(ResourceManager.carbonfiber_amount)
	current_electromagnet.text = str(ResourceManager.electormagnet_amount)
	current_circuitboard.text = str(ResourceManager.circuitboard_amount)
	current_hoverboard.text = str(ResourceManager.hoverboard_amount)


func _on_tree_entered(tree):
	current_scene = tree
