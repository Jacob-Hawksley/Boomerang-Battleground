extends Button

var tempstate = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	
