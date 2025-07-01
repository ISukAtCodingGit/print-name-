extends Node2D

#Get local nodes
@onready var text: Sprite2D = $Text
@onready var label: Label = $Label

func _ready() -> void:
	pass


#Handle speech
func _on_detect_player_body_entered(body: Node2D) -> void:
	if body.name == "player":
		text.show()
		label.show()


#Hide speech
func _on_detect_player_body_exited(body: Node2D) -> void:
	text.hide()
	label.hide()
