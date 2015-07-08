
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var lose
var draw

func _ready():
	# Initialization here
	lose = get_node("Lose")
	draw = get_node("Draw")
	
func showDashBoard(iJudgement):
	# win
	if iJudgement == 1:
		print("win")
	# lose
	elif iJudgement == 0:
		lose.show()
	# draw
	else:
		draw.show()
