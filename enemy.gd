extends Node
@export var basicenemy = preload("res://basic_enemy.tscn")
@export var projenemy = preload("res://projectile_enemy.tscn")
var random = 0
func _ready() -> void:
	Main.enemynumber = 0
	Main.enemymax = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave' and Main.enemynumber < Main.enemymax:
		if Main.wave >= 3:
			random = randi() % 5
			if random == 0:
				spawnproj()
			else:
				spawnbasic()
		else:
			spawnbasic()
	if Main.gamestate == 'wave':
		Main.wavetimer -= delta
	if Main.wavetimer <= 0:
		Main.gamestate = 'upgrade'
		
func spawnbasic():
	var b = basicenemy.instantiate()
	add_child(b)
	Main.enemynumber += 1
func spawnproj():
	var p = projenemy.instantiate()
	add_child(p)
	Main.enemynumber += 1
