
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

func buttonPressed(index):
	var centerimage = get_node("BaseSprite/Center")
	if (centerimage != null):
		var showIndex = centerimage.set_run(false)
		print(showIndex)
		
func judgment(btnIndex, showIndex):
	pass
	# rock
	#if btnIndex == :
		#draw
	#elif btnIndex

func _on_btnRock_pressed():
	buttonPressed(0)
	

func _on_btnScissors_pressed():
	buttonPressed(1)

func _on_btnPaper_pressed():
	buttonPressed(2)
