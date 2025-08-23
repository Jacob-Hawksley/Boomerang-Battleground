extends Area2D
@export var player: CharacterBody2D 

func hurtplayer(damage):
	if player.iframes == false:
		player.iframes = true
		Main.hp -= damage * ((Main.damagescale * Main.wave) + 1 )
		await get_tree().create_timer(0.5).timeout
		player.iframes = false
