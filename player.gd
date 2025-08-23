extends CharacterBody2D

@export var speed = 400
@export var Bullet = preload('res://bullet.tscn')
var throwcd = 2
@export var Marker: Marker2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $Camera2D/TextureProgressBar
@onready var hpnum: Label = $Camera2D/TextureProgressBar/Label
var hp = 7
var iframes = false

func _ready() -> void:
	position.x = 500
	position.y = 500
	hpbar.max_value = Main.maxhp
	hp = Main.maxhp

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	hpbar.value = hp
	if Main.gamestate == 'upgrade':
		hpbar.max_value = Main.maxhp
		hp = Main.maxhp
	if hp <= 0:
		get_tree().quit()
	hpnum.text = str(ceil(hp)) + '/' + str(Main.maxhp)
	if hp < Main.maxhp:
		hp += Main.hpregen * delta
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if input_direction.x < 0:
		sprite.flip_h = true
	elif input_direction.x > 0:
		sprite.flip_h = false
	if velocity == Vector2.ZERO:
		sprite.play('default')
	else:
		sprite.play("run")

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
