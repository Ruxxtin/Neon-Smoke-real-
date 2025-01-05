extends Area2D

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)

func _on_body_entered(body):
	if body.name == "Player":
		body.can_move = false
		run_dialogue("shrimpFriedRice")

func run_dialogue(dialogue_timeline):
	Dialogic.start(dialogue_timeline)

func DialogueSignal():
	pass
