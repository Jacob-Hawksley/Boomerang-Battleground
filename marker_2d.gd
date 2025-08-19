extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var aimdirection = Input.get_vector('aimleft','aimright','aimup','aimdown')
	if aimdirection != Vector2.ZERO:
		rotation = aimdirection.angle()
