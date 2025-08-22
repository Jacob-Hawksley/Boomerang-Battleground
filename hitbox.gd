extends Area2D
@export var player: CharacterBody2D 

func hurtplayer(damage):
	if player.iframes == false:
		player.iframes = true
		player.hp -= damage * Main.damagescale
		await get_tree().create_timer(0.5).timeout
		player.iframes = false
