extends Area2D

var scene_reload_pending := false

func _on_body_entered(body: Node2D) -> void:
	if scene_reload_pending:
		return

	if body.name == "player" or body.name == "Player":
		print("Player entered the killzone!")
		scene_reload_pending = true
		_safe_death(body)  # Trigger death
		# Reload the current level using GameManager
		var game_manager = get_node("/root/Gamemanager")
		game_manager.load_level(game_manager.current_level)

func _safe_death(body: Node2D) -> void:
	if is_instance_valid(body):
		print("Calling death directly")
