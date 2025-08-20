extends CharacterBody2D
const basehp = 100
var speed = 100
var player: CharacterBody2D 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 50 + (randi() % 1550)
	position.y = 50 + (randi() % 1125)
	player = get_node('../Player')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	move_and_slide()
	
	
  
