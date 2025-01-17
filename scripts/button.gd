extends Button

@onready var crafting = $"../.."
var maxNum
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	maxNum = crafting.items.size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if num < maxNum:
		num += 1
	else:
		num = 0
	text = str(num)
