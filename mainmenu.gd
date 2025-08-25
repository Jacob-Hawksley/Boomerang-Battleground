extends AnimatedSprite2D

func _process(delta: float) -> void:
	if Main.gamestate == 'mainmenu':
		play("Mainmenu")
		get_tree().paused = true
		visible = true
	elif Main.gamestate == 'controls':
		play("Controls")
		visible = true
	else:
		visible = false
