extends Control

var counter = false

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if !counter:
			$Label.text = "Esse cara tem razão. É melhor eu começar a procurar pelo ponto fraco canino antes que eu acabe me tornando parte do lixo."
			counter = true
		else:
			get_tree().change_scene("res://Comics/Slide17.tscn")
