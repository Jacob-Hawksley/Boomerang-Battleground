extends Node
@export var basicenemy = preload("res://basic_enemy.tscn")
@export var projenemy = preload("res://projectile_enemy.tscn")
@export var chargeenemy = preload("res://charge_enemy.tscn")
@export var mageenemy = preload("res://mage_enemy.tscn")
var random = 0
func _ready() -> void:
	Main.enemynumber = 0
	Main.enemymax = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.gamestate == 'wave' and Main.enemynumber < Main.enemymax:
		if Main.wave >= 7:
			random = randi() % 11
			if random <= 3:
				spawnproj()
			elif random <= 5:
				spawnmage()
			elif random <= 7:
				spawncharge()
			else:
				spawnbasic()
		if Main.wave >= 5:
			random = randi() % 5
			if random == 0:
				spawnproj()
			if random == 1:
				spawncharge()
			else:
				spawnbasic()
		elif Main.wave >= 3:
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
func spawncharge():
	var c = chargeenemy.instantiate()
	add_child(c)
	Main.enemynumber += 1
func spawnmage():
	var m = mageenemy.instantiate()
	add_child(m)
	Main.enemynumber += 1
