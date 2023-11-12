extends CharacterBody2D

@onready var animations = $Sprite2D/AnimationPlayer

func _physics_process(delta):
	animatePlayer()
	movePlayer()
	move_and_slide()
	GetValue()

func GetValue():
	Global.playerpositionx = global_position.x
	Global.playerpositiony = global_position.y

func animatePlayer():
	if Input.is_action_pressed("ui_left"):
		animations.play("left")
	elif Input.is_action_pressed("right"):
		animations.play("right")
	else:
		animations.play("up")

func movePlayer():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity.x=0
	velocity.y=0
	if Input.is_action_pressed("right"):
		velocity.x = Global.playerspeed
	elif Input.is_action_pressed("left"):
		velocity.x = -Global.playerspeed
	
	if Input.is_action_pressed("down"):
		velocity.y = Global.playerspeed
	elif Input.is_action_pressed("up"):
		velocity.y = -Global.playerspeed
