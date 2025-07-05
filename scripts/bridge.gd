extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	collision_shape.set_deferred("disabled", true)

func get_bridge():
	print("spawning bridge")
	sprite.visible = true
	collision_shape.set_deferred("disabled", false)
