extends Node2D

const bullet = preload("res://Scenes/DogBullet.tscn")
onready var shootTimer = $ShootTimer
onready var changeAttackTimer = $ChangeAttackTimer
onready var gun = $Gun

const rotateSpeeds = [120, 60, 0]
var shooterTimers = [0.2, 0.4, 0.33]
const spawnPointCounts = [2, 6, 12]
const radius = 200
const changeAttackTime = 5

var rotateSpeed = rotateSpeeds[0]
var shooterTimer = shooterTimers[0]
var spawnPointCount = spawnPointCounts[0]
var currentAttack = 0

#var isDescending = false
#var isAscending = false
#const speed = 300
#var targetHeight:int
#var screenBorders = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
#var rng = RandomNumberGenerator.new()

const maxHP = 3720
var hp = maxHP
var healthy = true
onready var player = get_parent().get_node("CatPlayer")

func _ready():
	get_parent().get_node("TextureProgress").value = hp
	changeAttackTimer.wait_time = changeAttackTime
	changeAttackTimer.start()
	setUpAttack()

func _process(delta):
	var newRotation = gun.rotation_degrees + rotateSpeed * delta
	gun.rotation_degrees = fmod(newRotation, 360)
	get_parent().get_node("TextureProgress").value = hp
	if hp <= 0:
		$AudioStreamPlayer.play()
		get_tree().change_scene("res://Comics/Slide19.tscn")
	if (hp <= maxHP/3) and healthy:
			healthy = false
			#get_node("WantToMoveTimer").stop()
			#position = screenBorders/2
			#setUpAttack()
	#if !healthy:
	#	get_parent().get_node("res://Scenes/RatBoss.tscn").healthy = false
	#if isDescending:
	#	position.y -= speed * delta
	#	if position.y <= targetHeight:
	#		isDescending = false
	#if isAscending:
	#	position.y += speed * delta
	#	if position.y >= targetHeight:
	#		isAscending = false

func _on_Timer_timeout():
	var index = 1
	for i in gun.get_children():
		#if healthy:
		#	i.look_at(player.position)
		#	i.rotate((PI/spawnPointCount)*(index/2)*(1+(-2*(index%2))))
		var bul = bullet.instance()
		self.get_parent().add_child(bul)
		bul.position = i.global_position
		bul.rotation = i.global_rotation
		bul.rotationChange = 0
		index += 1


func _on_ChangeAttackTimer_timeout():
	if currentAttack<2:
		currentAttack += 1
	else:
		currentAttack = 0
	rotateSpeed = rotateSpeeds[currentAttack]
	shooterTimer = shooterTimers[currentAttack]
	spawnPointCount = spawnPointCounts[currentAttack]
	
	setUpAttack()

func setUpAttack() -> void:
	for i in gun.get_children():
			i.queue_free()
	var step = 2*PI/spawnPointCount
	for i in range(spawnPointCount):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step*i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		gun.add_child(spawnPoint)
	shootTimer.wait_time = shooterTimer
	shootTimer.start()


func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group("PlayerBullets"):
		area.get_parent().queue_free()
		hp -= 1
		$HitSound.play()


#func _on_WantToMoveTimer_timeout():
#	if !isDescending and !isAscending:
#		targetHeight = rng.randi_range(80, screenBorders.y - 80)
#		if position.y > targetHeight:
#			isDescending = true
#		else:
#			isAscending = true
