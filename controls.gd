extends Button

var tempstate = null
var tempmenu = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'menu':
		tempmenu = 'menu'
		visible = true
		disabled = false
	elif Main.gamestate == 'mainmenu':
		tempmenu = 'mainmenu'
		visible = true
		disabled = false
	else:
		visible = false
		disabled = true
	if Main.gamestate == 'controls' and Input.is_action_just_pressed("menu"):
		Main.gamestate = tempmenu


func _on_pressed() -> void:
	Main.gamestate = 'controls'

	
