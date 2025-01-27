extends Area2D

@export_enum("Iron","Battery","Wire","CarbonFiber") var Holding: String

var touching_player = false
var playerref
var dug_through_trash = false


## NOTE TO SELF PLEASE READ THIS WE NEED TO HAVE TRASHCAN MINIGAME LIKE FISHING MINIGAME BUT
## INSTEAD OF HOOK ITS HAND AND YOU HAVE TO DODGE TRASH AND THERES RESOURCES AND DEEPER IN
## IS BETTER RESOURCES LIKE MAYBE STUFF THATS ALREADY CRAFTED YAY DO THIS LATER AFTER COMPETITION

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)

func _on_body_entered(body):
	if body.name == "Player":
		touching_player = true
	playerref = body

func _on_body_exited(body):
	if body.name == "Player":
		touching_player = false

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and dug_through_trash == false and touching_player == true:
		Dialogic.start("trash_dig")
		playerref.can_move = false
		dug_through_trash = true

func DialogueSignal(arg: String):
	if arg == "no_dig":
		dug_through_trash = false
		playerref.can_move = true
	if arg == "done":
		playerref.can_move = true
		match Holding:
			"Iron":
				ResourceManager.add_iron()
			"Battery":
				ResourceManager.add_battery()
			"Wire":
				ResourceManager.add_wire()
			"CarbonFiber":
				ResourceManager.add_carbonfiber()
			
