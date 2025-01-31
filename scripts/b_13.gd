extends Area2D

var dialogue_happening = false
var touching_player = false
@onready var player = $"../Player"

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and touching_player == true and dialogue_happening == false:
		Dialogic.start("wake up little fella")
		player.can_move = false
		dialogue_happening = true
	if Global.has_lil_guy == true:
		queue_free()


func _on_body_entered(body):
	touching_player = true


func _on_body_exited(body):
	touching_player = false


func DialogueSignal(arg: String):
	if arg == "end_of_convo":
		player.can_move = true
		dialogue_happening = false
	if arg == "minus_batteries":
		ResourceManager.battery_amount -= 2
	if arg == "got_robot":
		Global.has_lil_guy = true
		queue_free()
