extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave':
		queue_free()


func _on_pressed() -> void:
	Main.bounces += 1
	Main.upgraded = true
