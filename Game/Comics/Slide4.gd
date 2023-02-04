extends Control

var counter = 0

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if counter == 0:
			get_node("Label").text = "Porque será que ele saiu?"
			counter += 1
		elif counter == 1:
			get_node("Label").text = "Porque será que ele saiu? Eu estava encurralado."
			counter += 1
			#Porque será que ele saiu? Eu estava encurralado.
		elif counter > 1:
			get_tree().change_scene("res://Comics/Slide5.tscn")
