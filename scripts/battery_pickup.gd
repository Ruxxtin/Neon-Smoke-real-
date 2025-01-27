extends Area2D

@export_enum("Park", "Cellar") var location: String

func _on_body_entered(body): 
	if location == "Park":
		GlobalPickupManager.park_battery_got = true
	if location == "Cellar":
		if Global.start_cutscene_played == true:
			GlobalPickupManager.cellar_battery_got = true

func _physics_process(delta):
	match location:
		"Park":
			if GlobalPickupManager.park_battery_got == true:
				GlobalPickup.play(0)
				ResourceManager.add_battery()
				queue_free()
		"Cellar":
			if GlobalPickupManager.cellar_battery_got == true:
				if Global.start_cutscene_played == true:
					GlobalPickup.play(0)
					ResourceManager.battery_amount += 1
					queue_free()
