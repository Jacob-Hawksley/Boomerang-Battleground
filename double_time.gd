extends AudioStreamPlayer2D
func _process(delta: float) -> void:
	if Main.gamestate == 'wave' and Main.wave <= 2 and playing == false:
		play()
	elif Main.gamestate != 'wave':
		stop()
