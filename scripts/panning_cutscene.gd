extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "pan_up":
		animation_player.play("n_s")
	if anim_name == "n_s":
		animated_sprite_2d.play("moving")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite_2d.play("staying")
