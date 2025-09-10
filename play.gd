extends Button

var tempstate = 'wave'
var highlighted = false
var needtofocus = true
var moved = false
var aimed = false
var shot = false
var tutstarted = false
@onready var tutorialpopup = $"../TutorialPopup"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.wave == 0:
		if not tutstarted:
			tutorialpopup.text = 'Would you like a tutorial Q/L1 = Yes E/R1 = No'
		tutorialpopup.visible = true
		if Input.is_action_just_pressed('leftup'):
			tutstarted = true
		if tutstarted and Main.wave == 0:
			tutorial()
		if Input.is_action_just_pressed('rightup'):
			Main.wave = 1
			tutorialpopup.visible = false
		
	if Main.gamestate != 'menu' and Main.gamestate != 'mainmenu':
		needtofocus = true
	if Main.gamestate == 'menu':
		visible = true
		disabled = false
		if needtofocus:
			grab_focus()
			needtofocus = false
	elif Main.gamestate == 'mainmenu':
		visible = true
		disabled = false
		if needtofocus:
			grab_focus()
			needtofocus = false
	else:
		visible = false
		disabled = true
	if Input.is_action_just_pressed("menu") and Main.gamestate != 'controls': 
		if Main.gamestate == 'wave':
			menu()
		elif Main.gamestate == 'mainmenu':
			get_tree().paused = false
			Main.gamestate = 'wave'
			
		else:
			unmenu()
	if Main.wave == 0 and Input.is_action_just_pressed('left'):
		moved = true
	if Main.wave == 0 and Input.is_action_just_pressed('right'):
		moved = true
	if Main.wave == 0 and Input.is_action_just_pressed('up'):
		moved = true
	if Main.wave == 0 and Input.is_action_just_pressed('down'):
		moved = true
	if Main.wave == 0 and Input.is_action_just_pressed('aimleft'):
		aimed = true
	if Main.wave == 0 and Input.is_action_just_pressed('aimright'):
		aimed = true
	if Main.wave == 0 and Input.is_action_just_pressed('aimup'):
		aimed = true
	if Main.wave == 0 and Input.is_action_just_pressed('aimdown'):
		aimed = true
	if Main.wave == 0 and Input.is_action_just_pressed('shoot'):
		shot = true
func menu():
	get_tree().paused = true
	tempstate = Main.gamestate
	Main.gamestate = 'menu'
func unmenu():
	get_tree().paused = false
	Main.gamestate = tempstate



func _on_pressed() -> void:
	if Main.gamestate == 'mainmenu':
		Main.wave = 0
		get_tree().paused = false
		Main.gamestate = 'wave'

	else:
		unmenu()

func tutorial():
	if not moved: 
		tutorialpopup.text = 'WASD/LeftStick = Movement'
	elif not aimed:
		tutorialpopup.text = 'ArrowKeys/RightStick = Aim'
	elif not shot:
		tutorialpopup.text = 'Space/A = Shoot'
	else:
		tutorialpopup.text = 'Awesome! Press Q/L1 to play!'
		if Input.is_action_just_pressed('leftup'):
			Main.wave = 1
			tutorialpopup.visible = false
			
		
