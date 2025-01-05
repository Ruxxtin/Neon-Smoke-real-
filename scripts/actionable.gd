extends Area2D


const Balloon = preload("res://scenes/game.tscn")


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "cryolab_cutscene"


func action():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
