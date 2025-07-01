extends Area2D

var base_y := 0.0
var bob_time := 0.0
const BOB_HEIGHT := 5.0
const BOB_SPEED := 2.0

func _ready() -> void:
	base_y = global_position.y

#Bobing
func _physics_process(delta: float) -> void:
	bob_time += delta * BOB_SPEED
	global_position.y = base_y + sin(bob_time) * BOB_HEIGHT

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("boost_add"):
		body.boost_add(1)
		print("Boosted")
		queue_free()
