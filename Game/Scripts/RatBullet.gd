extends Node2D

const speed = 2000
var rotationChange = 0

func _ready():
	pass
	
func _process(delta):
	position += Vector2(cos(rotation), sin(rotation)) * speed * delta
	rotation_degrees += rotationChange * delta


func _on_Timer_timeout():
	self.queue_free()
