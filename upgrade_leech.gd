extends Button
var timer = 0
var slot = ''
func slots(place):
	slot = place
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if Main.gamestate == 'wave':
		queue_free()
	if Input.is_action_just_pressed(slot) and timer > 1:
		Main.leech += 0.25
		Main.upgraded = true

func _on_pressed() -> void:
	Main.leech += 0.25
	Main.upgraded = true
