extends Sprite2D

func _process(delta: float) -> void:
	if Main.gamestate == 'mainmenu':
		get_tree().paused = true
		visible = true
	else:
		visible = false
