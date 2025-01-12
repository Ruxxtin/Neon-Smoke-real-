extends AudioStreamPlayer2D

var loop_start = 32.0  # Loop start time in seconds
var loop_end = 56.63   # Loop end time in seconds

func _ready():
	# Start playing the audio
	play()

func _process(delta):
	# Check if playback has reached the loop end
	if get_playback_position() >= loop_end:
		# Reset playback position to the loop start
		seek(loop_start)
