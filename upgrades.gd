extends Node
var randomcard = null
@export var bounce: PackedScene = preload("res://bouncy.tscn")
@export var healthy: PackedScene = preload("res://healthy.tscn")
@onready var player: CharacterBody2D = get_node('../Player')
@export var explosive = preload("res://explosive.tscn")
@export var leech = preload('res://leech.tscn')
@export var fastthrows = preload('res://fast_throws.tscn')
var wavebuffer = false
var upgrade_spawned = false
var shop1 = null

func _process(delta: float) -> void:
	if Main.gamestate == 'upgrade' and not wavebuffer and not upgrade_spawned:
		upgrade_spawned = true  # Immediately prevent multiple spawns
		spawn_upgrade_cards()
	if Main.upgraded == true:
		Main.wavetimer = 60
		Main.wave += 1
		Main.hpscale *= 1.1
		Main.damagescale *= 1.1
		Main.enemymax *= 1.1
		Main.gamestate = 'wave'
		get_tree().paused = false
		Main.upgraded = false
		wavebuffer = false
		upgrade_spawned = false  # Reset for next upgrade phase

func spawn_upgrade_cards():
	await get_tree().create_timer(0.2).timeout
	wavebuffer = true
	get_tree().paused = true
	
	for i in range(2):
		randomcard = randi() % 5
		if shop1 == null:	
			shop1 = randomcard
		while shop1 == randomcard:
			randomcard = randi() % 5
		var card_instance = null
		
		match randomcard:
			0:
				card_instance = bounce.instantiate()
			1:
				card_instance = healthy.instantiate()
			2:
				card_instance = explosive.instantiate()
			3:
				card_instance = leech.instantiate()
			4:
				card_instance = fastthrows.instantiate()
		
		if card_instance:
			add_child(card_instance)
			card_instance.position = player.global_position
			if i == 0:
				card_instance.slots('left')
				card_instance.position.x += -231.5
				card_instance.position.y += -49
			else:
				card_instance.slots('right')
				card_instance.position.x += 99.5
				card_instance.position.y += -48
	shop1 = null
