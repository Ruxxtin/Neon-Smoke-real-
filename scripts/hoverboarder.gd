extends Area2D

var touching_player = false
var doing_dialogue = false

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and ResourceManager.hoverboard_amount > 0:
		if touching_player == true and doing_dialogue == false:
			Dialogic.start("hoverboard")
			doing_dialogue = true

func _on_body_entered(body):
	if body.is_in_group("Player"):
		touching_player = true


func _on_body_exited(body):
	if body.is_in_group("Player"):
		touching_player = false
