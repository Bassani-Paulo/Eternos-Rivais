extends Node

var menuMusic = load("res://Sounds/MenuMusic.mp3")
var arena1Music = load("res://Sounds/Arena1Music.mp3")
var arena2Music = load("res://Sounds/Arena2Music.mp3")

onready var player = $AudioStreamPlayer

func playMusic(x:int):
	if x == 0:
		player.stream = menuMusic
	elif x == 1:
		player.stream = arena1Music
	elif x == 2:
		player.stream = arena2Music
	player.play()
	
func stopMusic():
	player.stop()
