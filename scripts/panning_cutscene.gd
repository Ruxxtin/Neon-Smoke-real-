extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer
@onready var sirens = $sirens


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "pan_up":
		animation_player.play("n_s")
	if anim_name == "n_s":
		animated_sprite_2d.play("moving")
	if anim_name == "move_stuff":
		animation_player.play("credits")
	if anim_name == "credits":
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		Global.last_building = "sykul"
		get_tree().change_scene_to_file("res://scenes/bridge_cutscene.tscn")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("staying")
	timer.start()

func _on_timer_timeout():
	animation_player.play("move_stuff")
