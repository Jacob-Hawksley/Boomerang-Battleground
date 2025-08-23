extends Area2D
var active = false
var damage = 1
@onready var sprite = $AnimatedSprite2D
func _ready() -> void:
	sprite.play("prep")
	await get_tree().create_timer(0.5).timeout
	active = true
	await get_tree().create_timer(1.5).timeout
	queue_free()

func _process(delta: float) -> void:
	if Main.gamestate == 'upgrade':
		queue_free()
	if active:
		sprite.play("default")
		



func _on_area_entered(area: Area2D) -> void:
	if active:
		if area.has_method('hurtplayer'):
			area.hurtplayer(damage)
