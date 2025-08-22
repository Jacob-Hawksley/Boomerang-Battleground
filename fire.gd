extends Area2D

const speed = 350
var damage = 1
var lifespan = 4

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	if lifespan <= 0:
		queue_free()
	else:
		lifespan -= delta
	

func _on_area_entered(area: Area2D) -> void:
	if area.has_method('hurtplayer'):
		area.hurtplayer(damage)
		queue_free()
