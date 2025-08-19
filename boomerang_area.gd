extends Area2D

var speed = 750


func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	rotation += 0.01

func _on_Bullet_body_entered(body):
	queue_free()
  
