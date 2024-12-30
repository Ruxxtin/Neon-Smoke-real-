extends Area2D

@onready var textbox = $"../Player/Camera2D/textbox"
@onready var player = $"../Player"
@onready var textbox_box = $"../Player/Camera2D/textbox/textbox_box"
@onready var timer = $Timer

var touching_player = false
var player_cant_move = false

func _ready():
	textbox_box.visible = false

func _on_body_entered(body):
	touching_player = true

func _on_body_exited(body):
	touching_player = false


func _physics_process(delta):
	if touching_player == true:
		if Input.is_action_just_pressed("interact"):
			if player_cant_move == false:
				textbox.visible_characters = 0
				timer.start()
				player_cant_move = true
				if ResourceManager.battery_amount < 2:
					textbox.text = "DEAD BATTERIES."
				elif ResourceManager.battery_amount >= 2:
					textbox.text = "*THANK YOU FOR REPLACING MY BATTERIES. MY NAME IS _____. NICE TO MEET YOU, HUMAN."
				textbox_box.visible = true
			elif textbox.visible_ratio >= 1:
				player_cant_move = false
				textbox.text = ""
				textbox_box.visible = false
			else:
				textbox.visible_characters = 1000
	if player_cant_move == true:
		player.can_move = false
	else:
		player.can_move = true

func _on_timer_timeout():
	textbox.visible_characters += 1



