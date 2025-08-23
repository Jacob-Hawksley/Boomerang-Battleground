extends Area2D

var damage = 0.5

func _ready() -> void:
	scale = Vector2(4,4)
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('hurt'):
		print('b')
		body.hurt(damage)
