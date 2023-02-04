extends Control

var counter = 0

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if counter == 0:
			get_node("Label").text = "Acabou pra você Rato. Dessa vez você não escapa!"
			counter += 1
		elif counter == 1:
			$AudioStreamPlayer.play()
			counter += 1
		elif counter >= 1:
			get_tree().change_scene("res://Comics/Slide3.tscn")
