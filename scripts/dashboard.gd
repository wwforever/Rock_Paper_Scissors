
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var lose
var draw
var numberShowTime = 0.05
var lastTime = 0
var numbers = []
var showNumberIndex = 0

func _ready():
	# Initialization here
	lose = get_node("Lose")
	draw = get_node("Draw")
	
	numbers = [0,0,0,0,0,0,0,0,0,0,0,0]
	
	numbers[0] = get_node("Numbers/0");
	numbers[1] = get_node("Numbers/1");
	numbers[2] = get_node("Numbers/2");
	numbers[3] = get_node("Numbers/3");
	numbers[4] = get_node("Numbers/4");
	numbers[5] = get_node("Numbers/5");
	numbers[6] = get_node("Numbers/6");
	numbers[7] = get_node("Numbers/7");
	numbers[8] = get_node("Numbers/8");
	numbers[9] = get_node("Numbers/9");
	numbers[10] = get_node("Numbers/10");
	numbers[11] = get_node("Numbers/11");
	
func _process(delta):
	lastTime += delta
	if (lastTime >= numberShowTime):
		numbers[showNumberIndex].hide()
		showNumberIndex += 1
		lastTime = 0
	
	if (showNumberIndex >= numbers.size()):
		showNumberIndex = 0
		
	numbers[showNumberIndex].show()
	
	
func showDashBoard(iJudgement):
	# win
	if iJudgement == 1:
		set_process(true);
	# lose
	elif iJudgement == 0:
		lose.show()
	# draw
	else:
		draw.show()
