extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not position.y <= 48:
		position.y -= 1
