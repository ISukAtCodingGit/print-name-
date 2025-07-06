extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var preview = TextureRect.new()
	preview.texture = texture
	preview.expand_mode = 1
	preview.size = Vector2(16, 16)

	var placeholder = Control.new()
	placeholder.add_child(preview)

	set_drag_preview(placeholder)
	texture = null

	# Hide the matching placed gear when dragging
	_toggle_placed_gear(false)

	return preview.texture

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(at_position: Vector2, data: Variant) -> void:
	texture = data

	# Show the matching placed gear on drop
	_toggle_placed_gear(true)

# 🔁 Toggle correct placed sprite
func _toggle_placed_gear(state: bool) -> void:
	var map = {
		"Gear_Puzzel": "placed gear",
		"Gear_Puzzel4": "placed gear2"
	}
	if name in map:
		var node_name = map[name]
		var placed_sprite = get_parent().get_node(node_name)
		if placed_sprite:
			placed_sprite.visible = state
