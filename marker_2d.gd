extends Marker2D
var closestdistance = 10000000000
var aimdirection = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	closestdistance = 10000000000000
	for i in Main.enemylist:
		if position.distance_squared_to(i.global_position) < closestdistance:
			Main.closestenemy = i
			closestdistance = position.distance_squared_to(Main.closestenemy.global_position)
	
	if Main.autoaim:
		if Main.enemylist != []:
			rotate(get_angle_to(Main.closestenemy.global_position)) 
	aimdirection = Input.get_vector('aimleft','aimright','aimup','aimdown')
	if aimdirection != Vector2.ZERO:
		rotation = aimdirection.angle()

	
