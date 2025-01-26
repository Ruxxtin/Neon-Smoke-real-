extends Area2D

@export_enum("Park", "Cellar") var location: String

func _on_body_entered(body):
	GlobalPickup.play(0)
	ResourceManager.add_battery()
	if location == "Park":
		GlobalPickupManager.park_battery_got = true
	if location == "Cellar":
		GlobalPickupManager.cellar_battery_got = true

func _physics_process(delta):
	match location:
		"Park":
			if GlobalPickupManager.park_battery_got == true:
				queue_free()
		"Cellar":
			if GlobalPickupManager.cellar_battery_got == true:
				queue_free()
