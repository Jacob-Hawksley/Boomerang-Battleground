extends CharacterBody2D
const basehp = 80
var speed = 90
var player: CharacterBody2D 
var hp = 80
var maxhp = 80
var shootcd = 4
var shooting = false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $TextureProgressBar
@onready var navagent: NavigationAgent2D = $NavigationAgent2D
@export var magic = preload("res://magic.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node('../../Player')
	maxhp *= (Main.hpscale * Main.wave) + 1
	hp = maxhp
	position.x = 50 + (randi() % 1550)
	position.y = 50 + (randi() % 1125)
	for i in range(5):
		if position.x > player.global_position.x - 150 and position.x < player.global_position.x + 150:
			if position.y > player.global_position.y - 150 and position.y < player.global_position.y + 150:
					position.x = 50 + (randi() % 1550)
					position.y = 50 + (randi() % 1125)
	hpbar.max_value = maxhp
	
	
func _process(delta: float) -> void:
	if not shooting:
		shootcd -= delta
	hpbar.value = hp
	if Main.gamestate == 'mainmenu':
		Main.enemynumber -= 1
		queue_free()
	if Main.gamestate == 'upgrade':
		Main.enemynumber -= 1
		queue_free()
	if shootcd <= 0:
		shoot()
		await get_tree().create_timer(0.5).timeout
		sprite.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if navagent.distance_to_target() > 230:
		velocity = (player.global_position - global_position).normalized() * speed
	elif navagent.distance_to_target() <= 200:
		velocity = ((player.global_position - global_position).normalized() * speed * -1) 
		
	if player.global_position.x < global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()
	

func hurt(amount):
	hp -= amount
	if hp <= 0:
		Main.xp += 1
		Main.enemynumber -= 1
		queue_free()
		
func shoot():
	sprite.play("magic")
	shootcd = 3
	for i in range(3):
		var m = magic.instantiate()
		get_node("/root/Main").add_child(m)
		m.position.x = 50 + (randi() % 1550)
		m.position.y = 50 + (randi() % 1125)

  
