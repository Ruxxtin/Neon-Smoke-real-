extends CanvasLayer

@onready var current_iron = $"iron ui/current_iron"
@onready var current_battery = $"battery ui/current_battery"
@onready var current_carbonfiber = $"carbonfiber ui/current_carbonfiber"
@onready var current_wire = $"wire ui/current_wire"
@onready var current_electromagnet = $"wire ui/electromagnet ui/current_electromagnet"
@onready var current_circuitboard = $"circuitboard ui/current_circuitboard"
@onready var current_hoverboard = $"hoverboard ui/current_hoverboard"
@onready var timer = $Timer

var previous_scene_path = ""
var current_scene = null

func _physics_process(_delta):
	current_iron.text = str(ResourceManager.iron_amount)
	current_battery.text = str(ResourceManager.battery_amount)
	current_wire.text = str(ResourceManager.wire_amount)
	current_carbonfiber.text = str(ResourceManager.carbonfiber_amount)
	current_electromagnet.text = str(ResourceManager.electormagnet_amount)
	current_circuitboard.text = str(ResourceManager.circuitboard_amount)
	current_hoverboard.text = str(ResourceManager.hoverboard_amount)
	
	var current_scene = get_tree().current_scene
	if current_scene:
		# Use metadata or name for identification
		var current_scene_path = current_scene.get_scene_file_path() if current_scene.has_method("get_scene_file_path") else ""
		if current_scene_path != previous_scene_path:
			previous_scene_path = current_scene_path
			_on_scene_changed(current_scene_path)

func _on_scene_changed(scene_path):
	if scene_path == "res://scenes/sykul_g_floor_cutscene.tscn":
		visible = false
	else:
		visible = true
