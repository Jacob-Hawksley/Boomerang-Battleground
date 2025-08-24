extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.thrown == true:
		visible = false
	elif Main.gamestate == 'menu':
		visible = false
	elif Main.gamestate == 'mainmenu':
		visible = false
	elif not Main.thrown and Main.gamestate == 'wave':
		visible = true
