extends Node
@export var basicenemy = preload("res://basic_enemy.tscn")


func _ready() -> void:
	Main.enemynumber = 0
	Main.enemymax = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave' and Main.enemynumber < Main.enemymax:
		var b = basicenemy.instantiate()
		owner.add_child(b)
		Main.enemynumber += 1
		
		
