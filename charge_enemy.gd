extends CharacterBody2D
const basehp = 120
var speed = 90
var player: CharacterBody2D 
var hp = 120
var maxhp = 120
var basedamage = 1
var damage = 1
var charging = false
var chargecd = 3
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $TextureProgressBar
@onready var collision: CollisionShape2D = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node('../../Player')
	apply_scale(Vector2(4,4))
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
	hpbar.value = hp
	if Main.gamestate == 'mainmenu':
		Main.enemynumber -= 1
		queue_free()
	if Main.gamestate == 'upgrade':
		Main.enemynumber -= 1
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not charging:
		sprite.play('default')
		chargecd -= delta
		velocity = (player.global_position - global_position).normalized() * speed
		if velocity.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	if chargecd <= 0:
		charge()
	
	
	move_and_slide()
	
func charge():
	
	charging = true
	sprite.play('charge')
	chargecd = 3
	damage = 1.5
	var tempvelocity = velocity
	velocity = tempvelocity * 5
	await get_tree().create_timer((randi() % 3) + 2).timeout
	charging = false
	damage = 1
	
	



func hurt(amount):
	hp -= amount
	if hp <= 0:
		Main.xp += 3
		Main.enemynumber -= 1
		queue_free()
		
	
	
  




func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.has_method('hurtplayer'):
		area.hurtplayer(damage)
