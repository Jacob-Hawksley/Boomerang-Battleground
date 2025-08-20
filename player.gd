extends CharacterBody2D

@export var speed = 400
@export var Bullet = preload('res://bullet.tscn')
@onready var throwcd = 2
@export var Marker: Marker2D

func _ready() -> void:
	position.x = 500
	position.y = 500
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
func shoot():
	if Main.thrown != true:
		Main.thrown = true
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.transform = Marker.global_transform
		await get_tree().create_timer(throwcd).timeout
		Main.thrown = false
		
