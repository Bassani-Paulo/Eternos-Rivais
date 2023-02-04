extends Node2D

var totalHearts = 5
var specialAttackPercentage = 0
const specialAttackDamage = 1200

func _ready():
	pass


func _process(delta):
	if get_node("Hearts").get_child_count() > totalHearts:
		get_node("Hearts").get_child(0).queue_free()
	
	if Input.is_action_just_pressed("specialAttack"):
		if specialAttackPercentage >= 24:
			specialAttackPercentage = 0
			get_node("DogBoss").hp -= specialAttackDamage
			get_node("ColorRect").visible = true
			get_node("VFXTimer").start()
			$EAUsePlayer.play()




func _on_SAPercentTimer_timeout():
	if specialAttackPercentage < 24:
		specialAttackPercentage += 1
		get_node("SAProgressBar").value = specialAttackPercentage
	elif specialAttackPercentage == 24:
		$EAReadyPlayer.play()
		specialAttackPercentage += 1


func _on_VFXTimer_timeout():
	get_node("ColorRect").visible = false
