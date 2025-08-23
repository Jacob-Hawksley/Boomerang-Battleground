extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave':
		queue_free()


func _on_pressed() -> void:
	if Main.explosive:
		Main.explosiondamage *= 1.3
	Main.explosive = true
	Main.upgraded = true
