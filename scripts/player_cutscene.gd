extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = -5
	Dialogic.signal_event.connect(DialogueSignal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not position.y <= 32:
		position.y -= 0.7

func DialogueSignal(arg: String):
	if arg == "start_fight":
		position = Vector2(152,19)
