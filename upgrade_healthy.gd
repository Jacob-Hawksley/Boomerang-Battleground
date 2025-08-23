extends Button

var slot = ''
func slots(place):
	slot = place
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave':
		queue_free()
	if Input.is_action_just_pressed(slot):
		Main.maxhp += 2
		Main.hpregen += 0.5
		Main.upgraded = true

func _on_pressed() -> void:
	Main.maxhp += 2
	Main.hpregen += 0.5
	Main.upgraded = true
