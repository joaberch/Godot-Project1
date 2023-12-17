extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
var animationString
var checkIsHurt

func _physics_process(_delta):
	getPosition()
	moveToAttackGoldKnight()
	animate()
	checkIfGameHasEnded()
	move_and_slide()

func getPosition():
	Global.redFrogPosition = position

func checkIfGameHasEnded():
	if Global.minigame2winner:
		queue_free()

func moveToAttackGoldKnight():
	if !Global.checkFrogAreAttacking || !checkIsHurt:
		if position.x < Global.goldKnightPositionx-10:
			velocity.x = Global.redFrogVelocity
		elif position.x > Global.goldKnightPositionx+10:
			velocity.x = -Global.redFrogVelocity
		else:
			velocity.x = 0
	else:
		velocity.x = 0

func animate():
	if !checkIsHurt:
		if !Global.checkFrogAreAttacking:
			if velocity.x > 0:
				animationString = "jump"
				animation.flip_h = true
			elif velocity.x < 0:
				animationString = "jump"
				animation.flip_h = false
			else:
				animationString = "idle"
		else:
			if Global.checkRedFrogCanAttack:
				animationString = "attack"
			else:
				animationString = "idle"
	else:
		animationString = "hit"
	animation.play(animationString)

func _on_frog_hitbox_area_entered(area):
	if area.name == "hitboxShuriken":
		checkIsHurt = true
		if animationString == "attack":
			Global.checkRedFrogCanAttack = false

func _on_animated_sprite_2d_animation_looped():
	if checkIsHurt:
		checkIsHurt = false
