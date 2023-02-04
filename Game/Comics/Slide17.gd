extends Control

var counter = false

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if !counter:
			get_node("Label").text = "Hum. Preciso ligar os pontos."
			counter = true
		else:
			get_tree().change_scene("res://Comics/Slide18.tscn")
