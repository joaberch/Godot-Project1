extends RigidBody2D

var life = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Global.redFrogPosition
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	move()
	checkEnd()

func move():
	position.y += Global.flameVelocity

func checkEnd():
	if position.y > 10000:
		queue_free()

func _on_flam_hitbox_area_entered(area):
	if area.name == "hitboxGoldKnight":
		Global.goldKnightDamageTaken += 1
	elif  area.name == "hitboxKnight":
		Global.knightDamageTaken += 1
	elif area.name == "hitboxShuriken":
		life -= 1
		if life == 0:
			queue_free()
