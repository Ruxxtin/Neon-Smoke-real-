extends CharacterBody2D

var started_cutscene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = -5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.y <= 48:
		if started_cutscene == false:
			run_dialogue("shrimpFriedRice")
			started_cutscene = true
	else:
		position.y -= 1

func run_dialogue(dialogue_timeline):
	Dialogic.start(dialogue_timeline)
