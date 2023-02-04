extends Control

var counter = 0

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if counter == 0:
			get_node("Label").text = "O que aconteceu?"
			get_node("Label").add_color_override("font_color", Color(0.65, 0.28, 0.28, 1))
			counter += 1
		elif counter == 1:
			get_node("Label").text = "Eu sou um merda."
			get_node("Label").add_color_override("font_color", Color(0.21, 0.21, 0.21, 1))
			counter += 1
		elif counter == 2:
			get_node("Label").text = "Poxa, é triste te ver assim."
			get_node("Label").add_color_override("font_color", Color(0.65, 0.28, 0.28, 1))
			counter += 1
		elif counter == 3:
			get_node("Label").text = "Saiba que eu sempre te admirei."
			counter += 1
		elif counter == 4:
			get_node("Label").text = "Saiba que eu sempre te admirei. A maneira como você lida com o Rato é incrível!"
			counter += 1
		elif counter == 5:
			get_node("Label").text = "Caso você não saiba, ele é meu arqui-inimigo."
			counter += 1
		elif counter == 6:
			get_node("Label").text = "Caso você não saiba, ele é meu arqui-inimigo. Sei que você vai sair dessa."
			counter += 1
		elif counter == 7:
			get_node("Label").text = "Acontece que ele se aliou com o Cachorro..."
			get_node("Label").add_color_override("font_color", Color(0.21, 0.21, 0.21, 1))
			counter += 1
		elif counter == 8:
			get_node("Label").text = "O Cachorro, "
			counter += 1
		elif counter == 9:
			get_node("Label").text = "O Cachorro, ele não é somente meu arqui-inimigo."
			counter += 1
		elif counter == 10:
			get_node("Label").text = "Ele é IMBATÍVEL!"
			counter += 1
		elif counter == 11:
			get_node("Label").text = "Escute amigo, ninguém é imbatível."
			get_node("Label").add_color_override("font_color", Color(0.65, 0.28, 0.28, 1))
			counter += 1
		elif counter == 12:
			get_node("Label").text = "Escute amigo, ninguém é imbatível. Não importa quão grande você seja, todo mundo tem seu arqui-inimigo."
			counter += 1
			#Porque será que ele saiu? Eu estava encurralado.
		elif counter > 12:
			get_tree().change_scene("res://Comics/Slide15.1.tscn")
