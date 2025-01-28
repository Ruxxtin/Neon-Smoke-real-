extends Node2D

@onready var spawn_player = $spawn_player
@onready var spawn_neeko = $spawn_neeko
@onready var spawn_ada = $spawn_ada

func _ready():
	spawn_player.start()
