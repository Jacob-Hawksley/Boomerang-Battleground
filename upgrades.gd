extends Node
var randomcard = null
@export var bounce: PackedScene = preload("res://bouncy.tscn")
@onready var player: CharacterBody2D = get_node('../Player')
var wavebuffer = false
func _process(delta: float) -> void:
	if Main.gamestate == 'upgrade' and wavebuffer == false:
		wavebuffer = true
		get_tree().paused = true
		for i in range(2):
			randomcard = randi() % 1
			if randomcard == 0:
				var b = bounce.instantiate()
				add_child(b)
				b.position = player.global_position
				if i == 0:
					b.position.x += -181.5
					b.position.y += -49
				else:
					b.position.x += 49.5
					b.position.y += -48
	if Main.upgraded == true:
			print('a')
			Main.wavetimer = 60
			Main.wave += 1
			Main.hpscale *= 1.1
			Main.damagescale *= 1.1
			Main.enemymax *= 1.1
			Main.gamestate = 'wave'
			get_tree().paused = false
			Main.upgraded = false
			wavebuffer = false
