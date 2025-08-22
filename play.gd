extends Button

var tempstate = null
var highlighted = false
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
	if Input.is_action_just_pressed("menu"):
		if Main.gamestate != 'menu':
			menu()
		elif Main.gamestate == 'mainmenu':
			pass
		else:
			unmenu()
		

func menu():
	get_tree().paused = true
	tempstate = Main.gamestate
	Main.gamestate = 'menu'
func unmenu():
	get_tree().paused = false
	Main.gamestate = tempstate


func _on_pressed() -> void:
	unmenu()
