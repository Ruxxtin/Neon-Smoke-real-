extends CharacterBody2D

var started_cutscene = false
var leave_tower = false
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = -5
	Dialogic.signal_event.connect(DialogueSignal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.y <= 48 and leave_tower == false:
		if started_cutscene == false:
			run_dialogue("shrimpFriedRice")
			started_cutscene = true
	elif position.y > 48:
		if leave_tower == false:
			position.y -= 1
	
	if leave_tower == true:
		position.y += 0.7

func run_dialogue(dialogue_timeline):
	Dialogic.start(dialogue_timeline)

func DialogueSignal(arg: String):
	if arg == "leave_tower":
		leave_tower = true
