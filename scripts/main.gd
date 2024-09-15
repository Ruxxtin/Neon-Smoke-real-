extends Node2D

@onready var ui = $ui
@onready var player = $Player



func _ready():
	pass

func _physics_process(delta):
	ui.new_iron = player.resource_amount_iron
	ui.new_battery = player.resource_amount_battery
