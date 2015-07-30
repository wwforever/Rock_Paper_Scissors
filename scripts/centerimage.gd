
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var images = []
var showIndex = 0
var titleShowTime = 1
var gamePlayShowTime = 0.05
var lastTime = 0.0

var is_run = true
var main

func _ready():
	# Initialization here
	images = [0,0,0]
	images[0] = get_node("Rock")
	images[1] = get_node("Scissors")
	images[2] = get_node("Paper")
	
	for i in range(3):
		if i != showIndex:
			images[i].hide()
			
	main = get_node("/root/Main")
			
	set_process(true)
	
func _process(delta):
	if main.gameState == main.TITLE_STATE:
		processCenterImage(delta, titleShowTime)
	elif main.gameState == main.GAME_PLAY:
		processCenterImage(delta, gamePlayShowTime)

func processCenterImage(delta, showTime):
	if is_run == false:
		return
		
	lastTime += delta
	if (lastTime >= showTime):
		images[showIndex].hide()
		showIndex += 1
		lastTime = 0
	
	if (showIndex >= images.size()):
		showIndex = 0

	images[showIndex].show()
	
func set_run(run):
	is_run = run
	return showIndex