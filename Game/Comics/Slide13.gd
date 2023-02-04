extends Control

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Comics/Slide14.tscn")

