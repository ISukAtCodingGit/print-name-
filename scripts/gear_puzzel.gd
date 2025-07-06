extends Node2D

@onready var placed_gear: Sprite2D = $"placed gear"

func _ready():
	# Start hidden
	placed_gear.visible = false

func show_placed_gear():
	placed_gear.visible = true
	print("shown")

func hide_placed_gear():
	placed_gear.visible = false
