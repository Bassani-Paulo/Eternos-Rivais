extends Control

onready var counter = 0

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if counter == 0:
			get_node("Label").text = "Falou comigo?"
			get_node("Label").add_color_override("font_color", Color(0.21, 0.21, 0.21, 1))
			counter += 1
		elif counter == 1:
			get_node("Label").text = "Não, "
			get_node("Label").add_color_override("font_color", Color(0.28, 0.12, 0, 1))
			counter += 1
		elif counter == 2:
			get_node("Label").text = "Não, falei com a P*ta que te pariu."
			counter += 1
		elif counter > 1:
			get_tree().change_scene("res://Comics/SlideExtra.tscn")
