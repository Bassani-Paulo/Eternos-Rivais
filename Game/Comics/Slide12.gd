extends Control

var counter = false

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		get_tree().change_scene("res://Comics/Slide13.tscn")
func _ready():
	MusicController.stopMusic()
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(2), "timeout")
	$ColorRect3.visible = false
	$Label2.visible = false
	MusicController.playMusic(0)
