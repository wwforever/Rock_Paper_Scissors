
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var centerimage
var dashboard

func _ready():
	# Initialization here
	centerimage = get_node("BaseSprite/Center")
	dashboard = get_node("BaseSprite/Dashboard")

func buttonPressed(index):
	if (centerimage != null):
		var iJudgement = judgment(index, centerimage.set_run(false))
		dashboard.showDashBoard(iJudgement)
		if (iJudgement == 1):
			var tick = OS.get_ticks_msec()
			seed(tick)
			var resultCoin = randi() % 12
			dashboard.setResultCoin(resultCoin)
		
func judgment(btnIndex, showIndex):
	# rock
	if btnIndex == 0:
		#draw
		if showIndex == 0:
			return 2
		# win
		elif showIndex == 1:
			return 1
		# lose
		else:
			return 0
	# scissors
	elif btnIndex == 1:
		#draw
		if showIndex == 1:
			return 2
		# win
		elif showIndex == 2:
			return 1
		# lose
		else:
			return 0
	# papers
	else:
		#draw
		if showIndex == 2:
			return 2
		# win
		elif showIndex == 0:
			return 1
		# lose
		else:
			return 0

func _on_btnRock_pressed():
	buttonPressed(0)

func _on_btnScissors_pressed():
	buttonPressed(1)

func _on_btnPaper_pressed():
	buttonPressed(2)
