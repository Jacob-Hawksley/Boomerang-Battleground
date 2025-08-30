extends AnimatedSprite2D

func _process(delta: float) -> void:
	if Main.autoaim:
		visible = true
	else:
		visible = false
