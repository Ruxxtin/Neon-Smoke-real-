extends AnimatedSprite2D

@onready var player = $"../../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.y < -112:
		z_index = 1
	else:
		z_index = 0
