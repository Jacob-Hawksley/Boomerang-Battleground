extends Area2D


var overlap = []
func _ready() -> void:
	scale = Vector2(8,8)
	visible = true
	await get_tree().create_timer(0.5).timeout
	queue_free()


func _process(delta: float) -> void:
	overlap = get_overlapping_bodies()
	for i in overlap:
		if i.has_method('hurt'):
			i.hurt((Main.explosiondamage * delta))
