extends Node
var randomcard = null
@export var bounce: PackedScene = preload("res://bouncy.tscn")
@export var healthy: PackedScene = preload("res://healthy.tscn")
@onready var player: CharacterBody2D = get_node('../Player')
var wavebuffer = false
func _process(delta: float) -> void:
	if Main.gamestate == 'upgrade' and wavebuffer == false:
		await get_tree().create_timer(0.2).timeout
		wavebuffer = true
		get_tree().paused = true
		for i in range(2):
			randomcard = randi() % 2
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
			if randomcard == 1:
				var h = healthy.instantiate()
				add_child(h)
				h.position = player.global_position
				if i == 0:
					h.position.x += -181.5
					h.position.y += -49
				else:
					h.position.x += 49.5
					h.position.y += -48
	if Main.upgraded == true:
			print('a')
			Main.wavetimer = 10
			Main.wave += 1
			Main.hpscale *= 1.1
			Main.damagescale *= 1.1
			Main.enemymax *= 1.1
			Main.gamestate = 'wave'
			get_tree().paused = false
			Main.upgraded = false
			wavebuffer = false
