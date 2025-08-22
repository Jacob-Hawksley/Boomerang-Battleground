extends Node



func _process(delta: float) -> void:
	if Main.gamestate == 'upgrade':
		Main.wavetimer = 60
		Main.gamestate = 'wave'
		print(Main.gamestate)
		Main.wave += 1
