extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	sprite.visible = false
	collision_shape.disabled = true

func get_bridge():
	if sprite:
		sprite.visible = true
	if collision_shape:
		collision_shape.disabled = false
