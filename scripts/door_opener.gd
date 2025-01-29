extends Area2D

@onready var player = $"../../../Player"
@onready var sprite_2d = $".."
@onready var big_door_yea = $"../big door yea"
var opened_door

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)

func _physics_process(delta):
	if Global.opened_door == true:
		opened_door = true
		sprite_2d.play("open")
		big_door_yea.queue_free()
		queue_free()

func _on_body_entered(body):
	if Global.has_lil_guy == true:
		player.can_move = false
		Dialogic.start("open_big_door")


func DialogueSignal(arg: String):
	if arg == "open_door":
		sprite_2d.play("opening")
		await sprite_2d.animation_finished
		sprite_2d.play("open")
		player.can_move = true
		Global.opened_door = true
		big_door_yea.queue_free()
		queue_free()
		
