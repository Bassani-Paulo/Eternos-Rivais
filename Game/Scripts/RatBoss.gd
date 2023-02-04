extends Node2D

const bullet = preload("res://Scenes/RatEnemyBullet.tscn")
onready var shootTimer = $ShootTimer
#onready var changeAttackTimer = $ChangeAttackTimer
onready var gun = $Gun

const rotateSpeeds = [0]
var shooterTimers = [0.75]
const spawnPointCounts = [1]
const radius = 200
#const changeAttackTime = 5

var rotateSpeed = rotateSpeeds[0]
var shooterTimer = shooterTimers[0]
var spawnPointCount = spawnPointCounts[0]
#var currentAttack = 0

#var isDescending = false
#var isAscending = false
const speed = 300
#var targetHeight:int
var screenBorders = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
#var rng = RandomNumberGenerator.new()

var dogIsHealthy = true
onready var player = get_parent().get_node("CatPlayer")

func _ready():
	var spawnPoint = Node2D.new()
	var pos = Vector2(radius, 0)
	spawnPoint.position = pos
	spawnPoint.rotation = pos.angle()
	gun.add_child(spawnPoint)
	shootTimer.wait_time = shooterTimer
	shootTimer.start()

func _process(delta):
	var newRotation = gun.rotation_degrees + rotateSpeed * delta
	gun.rotation_degrees = fmod(newRotation, 360)
	if get_parent().get_node("DogBoss").healthy == false:
		if distance(position, player.position) > 250:
			position += (player.position-position).normalized() * speed * delta
		pass

func _on_Timer_timeout():
	var index = 1
	for i in gun.get_children():
		i.look_at(player.position)
		i.rotate((PI/spawnPointCount)*(index/2)*(1+(-2*(index%2))))
		var bul = bullet.instance()
		self.get_parent().add_child(bul)
		bul.position = i.global_position
		bul.rotation = i.global_rotation
		bul.rotationChange = 0
		index += 1

#func _on_Area2D_area_entered(area):
#	if area.get_parent().is_in_group("PlayerBullets"):
#		area.get_parent().queue_free()
#		hp -= 1


func _on_WantToMoveTimer_timeout():
	pass
	#if !isDescending and !isAscending:
	#	targetHeight = rng.randi_range(80, screenBorders.y - 80)
	#	if position.y > targetHeight:
	#		isDescending = true
	#	else:
	#		isAscending = true

func distance(a:Vector2, b:Vector2) -> float:
	return sqrt(pow(a.x-b.x, 2) + pow(a.y-b.y, 2))
