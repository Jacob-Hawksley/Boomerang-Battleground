extends CharacterBody2D
const basehp = 100
var speed = 100
var player: CharacterBody2D 
var hp = 100
var maxhp = 100
var basedamage = 1
var damage = 1
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hpbar: TextureProgressBar = $TextureProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 50 + (randi() % 1550)
	position.y = 50 + (randi() % 1125)
	player = get_node('../Player')
	hpbar.max_value = maxhp
	
	
func _process(delta: float) -> void:
	hpbar.value = hp
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	move_and_slide()
	

func hurt(amount):
	hp -= amount
	if hp <= 0:
		Main.enemynumber -= 1
		queue_free()
		
	
	
  




func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.has_method('hurtplayer'):
		area.hurtplayer(damage)
