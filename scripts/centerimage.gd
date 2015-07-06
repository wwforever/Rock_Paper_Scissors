
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var images = []
var showIndex = 0
var showTime = 0.05
var lastTime = 0.0

func _ready():
	# Initialization here
	images = [0,0,0]
	images[0] = get_node("Scissors")
	images[1] = get_node("Rock")
	images[2] = get_node("Paper")
	
	for i in range(3):
		if i != showIndex:
			images[i].hide()
			
	set_process(true)
	
func _process(delta):
	lastTime += delta
	if (lastTime >= showTime):
		images[showIndex].hide()
		showIndex += 1
		lastTime = 0
	
	if (showIndex >= images.size()):
		showIndex = 0

	images[showIndex].show()