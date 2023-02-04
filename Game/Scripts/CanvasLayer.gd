extends CanvasLayer


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().get_node_count() >= 15:
			$ColorRect.visible = !$ColorRect.visible
			get_tree().paused = !get_tree().paused
