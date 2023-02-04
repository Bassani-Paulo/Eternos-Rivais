extends Area2D

const whiten_duration = 0.2
export (ShaderMaterial) var whiten_material
onready var timer = $Timer
var isInvincible = false
var isWhite = false

func _on_RatPlayerHitBox_area_entered(area):
	if area.get_parent().is_in_group("Bullets"):
		isInvincible = true
		timer.start()


func _on_Timer_timeout():
	if isInvincible:
		if isWhite:
			isWhite = false
			whiten_material.set_shader_param("whiten", false)
		else:
			isWhite = true
			whiten_material.set_shader_param("whiten", true)


func _on_InvincibleTimer_timeout():
	isInvincible = false
	whiten_material.set_shader_param("whiten", false)
