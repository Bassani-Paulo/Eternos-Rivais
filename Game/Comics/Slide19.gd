extends Control

var counter = 0

func _ready():
	$AudioStreamPlayer.play()
	MusicController.stopMusic()
	yield(get_tree().create_timer(2), "timeout")
	$ColorRect3.visible = false
	$Label2.visible = false
	MusicController.playMusic(0)

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		if counter == 0:
			get_node("Label").text = "Hehehe..."
			get_node("Label").add_color_override("font_color", Color(0.28, 0.12, 0, 1))
			counter += 1
		elif counter == 1:
			get_node("Label").text = "Hehehe... Preciso ir andando."
			counter += 1
		elif counter > 1:
			get_tree().change_scene("res://Comics/Credits.tscn")
