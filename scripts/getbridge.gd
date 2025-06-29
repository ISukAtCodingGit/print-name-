extends Area2D

var bridge_scene = preload("res://scenes/bridge.tscn")
var bridge = bridge_scene.instantiate()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		get_parent().add_child(bridge)
		await get_tree().process_frame
		bridge.get_bridge()
		print("bridge got")
