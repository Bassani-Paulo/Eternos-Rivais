extends Node2D

func _ready():
	yield(get_tree().create_timer(1.5), "timeout")
	MusicController.playMusic(0)


func _on_Button_pressed():
	if !MusicController.get_node("AudioStreamPlayer").playing:
		MusicController.playMusic(0)
	get_tree().change_scene("res://Comics/Slide1.tscn")
