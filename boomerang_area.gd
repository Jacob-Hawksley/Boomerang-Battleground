extends Area2D

var speed = 750
var needtoturn = true
var timepassed = 0
var damage = 50
var bounces = 0
var bouncesremaining = 0
func _physics_process(delta: float) -> void:
	if timepassed > 0.3 and speed > 15 and needtoturn == true:
		speed *= 0.96
	if speed <= 15 and needtoturn == true:
		needtoturn = false
		rotation_degrees -= 180
	if speed < 750 and needtoturn == false:
		speed *= 1.04
	
	position += transform.x * speed * delta
	timepassed += delta
	

func _on_body_entered(body: Node2D) -> void:
	if body.has_method('hurt') == true:
		body.hurt(damage)
	if bouncesremaining == 0:
		queue_free()
