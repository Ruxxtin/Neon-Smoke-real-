extends Area2D

@onready var slot_item_box_holder = $".."

func _process(delta):
	
	var colliding_bodies = get_overlapping_bodies()

	for body in colliding_bodies:

		if body.is_in_group('draggable_item'):
			slot_item_box_holder.add_to_group('occupied')
			slot_item_box_holder.remove_from_group('dropable')
		else:
			slot_item_box_holder.add_to_group('dropable')
			slot_item_box_holder.remove_from_group('occupied')
