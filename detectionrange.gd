extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Main.enemylist.append(body)


func _on_body_exited(body: Node2D) -> void:
	Main.enemylist.erase(body)

func _process(delta: float) -> void:
	print(Main.enemylist)
