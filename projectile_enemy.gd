extends CharacterBody2D
const basehp = 70
var speed = 90
var player: CharacterBody2D 
var hp = 70
var maxhp = 70
var basedamage = 1
var damage = 1
var shootcd = 0
@export var fire = preload("res://fire.tscn")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $TextureProgressBar
@onready var navagent: NavigationAgent2D = $NavigationAgent2D
@onready var marker: Marker2D = $Marker2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxhp *= Main.hpscale
	hp = maxhp
	position.x = 50 + (randi() % 1550)
	position.y = 50 + (randi() % 1125)
	player = get_node('../Player')
	hpbar.max_value = maxhp
	
	
	
	
func _process(delta: float) -> void:
	hpbar.value = hp
	navagent.target_position = player.global_position
	if shootcd <= 0:
		shootcd = 4
		sprite.play("shoot")
		await get_tree().create_timer(0.6).timeout
		shoot()
		sprite.play("default")
	if shootcd > 0:
		shootcd -= delta
	if Main.gamestate == 'mainmenu':
		Main.enemynumber -= 1
		queue_free()
	if Main.gamestate == 'upgrade':
		Main.enemynumber -= 1
		queue_free()
func _physics_process(delta: float) -> void:
	if navagent.distance_to_target() > 230:
		velocity = (player.global_position - global_position).normalized() * speed
	elif navagent.distance_to_target() <= 200:
		velocity = ((player.global_position - global_position).normalized() * speed * -1) 
		
	if player.global_position.x < global_position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	marker.rotation = get_angle_to(player.global_position)
	move_and_slide()
	

func hurt(amount):
	hp -= amount
	if hp <= 0:
		Main.enemynumber -= 1
		queue_free()
		
	
func shoot():
	var f = fire.instantiate()
	get_tree().root.add_child(f)
	f.transform = marker.global_transform
  




func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.has_method('hurtplayer'):
		area.hurtplayer(damage)
