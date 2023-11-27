extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString

func _physics_process(delta):
	moveToAttackGoldKnight()
	animate()
	move_and_slide()

func moveToAttackGoldKnight():
	if position.x < Global.goldKnightPositionx-10:
		velocity.x = Global.redFrogVelocity
	elif position.x > Global.goldKnightPositionx+10:
		velocity.x = -Global.redFrogVelocity
	else:
		velocity.x = 0
		attack()

func animate():
	if velocity.x > 0:
		animationString = "jump"
		animation.flip_h = true
	elif velocity.x < 0:
		animationString = "jump"
		animation.flip_h = false
	else:
		animationString = "attack"
	animation.play(animationString)

func attack():
	pass
