
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var images = []

func _ready():
	# Initialization here
	images = [0,0,0]
	images[0] = get_node("Scissors")
	images[1] = get_node("Rock")
	images[2] = get_node("Paper")
	
	for i in range(3):
		print(images[i].get_name())	
	


