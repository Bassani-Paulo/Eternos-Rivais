extends Control

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		get_tree().change_scene("res://Scenes/DogUnlockScreen.tscn")
