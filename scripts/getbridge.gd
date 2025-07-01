extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var on := false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var bridge = get_tree().current_scene.get_node("bridge")
		if on == false:
			animated_sprite_2d.play("default")
			on = true
		if bridge:
			bridge.show()
			if bridge.has_node("CollisionShape2D"):
				bridge.get_node("CollisionShape2D").set_deferred("disabled", false)
