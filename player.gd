extends CharacterBody2D

@export var speed = 400
@export var Bullet = preload('res://bullet.tscn')
@export var Marker: Marker2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $Camera2D/TextureProgressBar
@onready var hpnum: Label = $Camera2D/TextureProgressBar/Label
@onready var xpbar: Label = $Camera2D/xp
var iframes = false
var reqxp = 5
var waveiframe = 3


func _ready() -> void:
	position.x = 500
	position.y = 500
	hpbar.max_value = Main.maxhp
	Main.hp = Main.maxhp

func _process(delta: float) -> void:
	if Main.gamestate == 'wave' and waveiframe > 0:
		waveiframe -= delta
		iframes = true
	elif waveiframe <= 0:
		iframes = false
	if Main.gamestate == 'upgrade':
		waveiframe = 3
	if Input.is_action_just_pressed("shoot"):
		shoot()
	hpbar.max_value = Main.maxhp
	hpbar.value = Main.hp
	if Main.gamestate == 'upgrade':
		hpbar.max_value = Main.maxhp
		Main.hp = Main.maxhp
	if Main.hp <= 0:
		get_tree().quit()
	hpnum.text = str(floor(Main.hp)) + '/' + str(Main.maxhp)
	if Main.hp < Main.maxhp:
		Main.hp += Main.hpregen * delta
	if Main.xp >= reqxp:
		Main.xp -= reqxp
		Main.level += 1
		Main.maxhp += 1
		Main.damagemult += 0.1
		reqxp *= 1.3
		reqxp = ceil(reqxp)
	xpbar.text = 'Level ' + str(Main.level) + ': ' + str(Main.xp) + '/' + str(reqxp) 
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
		await get_tree().create_timer(Main.throwcd).timeout
		Main.thrown = false
