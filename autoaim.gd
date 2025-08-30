extends Button


func _on_pressed() -> void:
	Main.autoaim = not Main.autoaim

func _process(delta: float) -> void:
	if Main.gamestate == 'menu':
		visible = true
		disabled = false
	elif Main.gamestate == 'mainmenu':
		visible = true
		disabled = false
	else:
		visible = false
		disabled = true
