extends CharacterBody2D

var speed = 30
var max_speed = 85
var player_chase = false
var player = null
var target_node_name = "Player_fight"
var can_speed_increase = true

@onready var detection_zone = $"detection zone"
@onready var stamina_bar = $TextureProgressBar
@onready var stamina_decrease = $stamina_decrease
@onready var speed_increase = $speed_increase

func _ready():
	Dialogic.signal_event.connect(DialogueSignal)
	stamina_decrease.start()

func _physics_process(delta):
	
	if Global.fight_over == true:
		queue_free()
	
	if can_speed_increase == true and player_chase == true:
		speed += 0.2
	if speed >= max_speed:
		speed = max_speed
		can_speed_increase = false
	else:
		can_speed_increase = true
	
	var bodies = detection_zone.get_overlapping_bodies()
	
	for body in bodies:
		if body.name == target_node_name:
			player = body
	
	if player_chase == true:
		position += (player.position - position).normalized() * speed * delta
		move_and_collide(Vector2(0,0))
	
		
func DialogueSignal(arg: String):
	if arg == "start_fight":
		player_chase = true
	if arg == "resume_fight":
		player_chase = true


func _on_stamina_decrease_timeout():
	if player_chase == true:
		if stamina_bar.value == 45:
			player_chase = false
			speed = 70
			max_speed = 80
		if stamina_bar.value == 30:
			player_chase = false
			speed = 65
			max_speed = 75
		if stamina_bar.value == 15:
			player_chase = false
			speed = 0
			max_speed = 0
		stamina_bar.value -= 1
