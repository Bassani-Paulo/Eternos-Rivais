extends Node2D

func _ready():
	MusicController.playMusic(1)

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		get_tree().change_scene("res://Scenes/Arena1.tscn")
