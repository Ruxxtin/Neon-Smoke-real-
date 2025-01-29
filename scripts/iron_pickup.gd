extends Area2D

@export_enum("Park", "Street") var location: String

func _on_body_entered(body): 
	if location == "Park":
		if GlobalPickupManager.park_iron_got == false:
			GlobalPickup.play(0)
			ResourceManager.add_iron()
			GlobalPickupManager.park_iron_got = true
	if location == "Street":
		if GlobalPickupManager.street_iron_got == false:
			GlobalPickupManager.street_iron_got = true
			GlobalPickup.play(0)
			ResourceManager.add_iron()
			GlobalPickupManager.street_iron_got = true

func _physics_process(delta):
	match location:
		"Park":
			if GlobalPickupManager.park_iron_got == true:
				queue_free()
		"Street":
			if GlobalPickupManager.street_iron_got == true:
				queue_free()
