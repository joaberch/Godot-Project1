extends Node

@export var owlspeed = 500
@export var catspeed = 200
@export var lionspeed = 300
@export var timer = 60 #Timer before the game ends

var minigamenumber = 1

var playerpositionx
var playerpositiony
var changephase = false
var endgame = false
var timeremaining : int
var player1isowl = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if changephase:
		changephase = false
