extends Area2D

@export_enum("Park", "Cellar", "Arcade") var location: String

func _on_body_entered(body): 
	if location == "Park":
		if GlobalPickupManager.park_battery_got == false:
			GlobalPickup.play(0)
			ResourceManager.add_battery()
			GlobalPickupManager.park_battery_got = true
	if location == "Arcade":
		if GlobalPickupManager.arcade_battery_got == false:
			GlobalPickup.play(0)
			ResourceManager.add_battery()
			GlobalPickupManager.arcade_battery_got = true
	if location == "Cellar":
		if Global.start_cutscene_played == true:
			if GlobalPickupManager.cellar_battery_got == false:
				GlobalPickupManager.cellar_battery_got = true
				GlobalPickup.play(0)
				ResourceManager.battery_amount += 1
				GlobalPickupManager.cellar_battery_got = true

func _physics_process(delta):
	match location:
		"Park":
			if GlobalPickupManager.park_battery_got == true:
				queue_free()
		"Cellar":
			if GlobalPickupManager.cellar_battery_got == true:
				queue_free()
		"Arcade":
			if GlobalPickupManager.arcade_battery_got == true:
				queue_free()
