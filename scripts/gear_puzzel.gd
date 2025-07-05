extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	
	var preview = TextureRect.new()
	
	#placeholder texture settings
	#determines size and texture of the texture you "grab"
	preview.texture = texture
	preview.expand_mode = 1
	preview.size = Vector2(30,30)
	
	var placeholder = Control.new()
	placeholder.add_child(preview)
	
	set_drag_preview(placeholder)
	texture = null #removes the original sprite
	
	return preview.texture
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(at_position: Vector2, data: Variant) -> void:
	texture = data
