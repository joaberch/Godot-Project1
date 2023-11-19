extends Node2D

@onready var timer : Timer = $Timer
@onready var label : Label = $Label
@onready var player1win = $player1win
@onready var player2win = $player2win
@onready var GameEndSound = $GameEnd

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = Global.timer
	timer.start()  # Le timer déclenchera le signal "timeout" toutes les secondes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Global.timeremaining = timer.time_left
	label.text = str(Global.timeremaining)

func _on_timer_timeout():
	Global.endgame = true
	GameEndSound.play()
	if Global.player1isowl:
		player1win.visible = true
	else:
		player2win.visible = true

