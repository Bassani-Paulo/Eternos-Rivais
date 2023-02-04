extends Node2D

const speed = 200
const radius = 100
var hp = 5
var screenBorders = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
const offset = 20
var readyToShoot = true
var isInvincible = false
onready var invincibleTimer = $InvincibleTimer

const bullet = preload("res://Scenes/CatPlayerBullet.tscn")
onready var cooldown = $Cooldown
onready var gun = $Gun

func _ready():
	pass

func _process(delta):
	
	if Input.is_action_pressed("Fire") and readyToShoot:
		var bul = bullet.instance()
		bul.position = gun.global_position
		bul.rotation = gun.global_rotation
		self.get_parent().add_child(bul)
		readyToShoot = false
		cooldown.start()
		$FireSound.play()
	
	if Input.is_action_pressed("moveLeft"):
		self.position.x -= speed * delta
	if Input.is_action_pressed("moveRight"):
		self.position.x += speed * delta
	if Input.is_action_pressed("moveUp"):
		self.position.y -= speed * delta
	if Input.is_action_pressed("moveDown"):
		self.position.y += speed * delta
		
	position = Vector2(clamp(position.x, 0 + offset, screenBorders.x - offset), clamp(position.y, 0 + offset, screenBorders.y - offset))


func _on_RatPlayerHitBox_area_entered(area):
	if area.get_parent().is_in_group("Bullets"):
		if !isInvincible:
			area.get_parent().queue_free()
			hp -= 1
			$AudioStreamPlayer.play()
			isInvincible = true
			invincibleTimer.start()
			get_parent().totalHearts -= 1
			if(hp<=0):
				get_tree().change_scene("res://Scenes/GameOverScreen.tscn")


func _on_Cooldown_timeout():
	readyToShoot = true


func _on_InvincibleTimer_timeout():
	isInvincible = false
