extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var bridge = get_tree().current_scene.get_node("bridge")
		if bridge:
			bridge.show()
			if bridge.has_node("CollisionShape2D"):
				bridge.get_node("CollisionShape2D").set_deferred("disabled", false)
