
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var lose
var draw
const numberShowTime = 0.05
var lastTime = 0
var numbers = []
var showNumberIndex = 0
var resultCoinIndex = -1
const totalWinShowtTime = 1.5
var accumulatedResultTime = 0

const Lose_Draw_ShowTime = 1.0

var main

func _ready():
	# Initialization here
	lose = get_node("Lose")
	draw = get_node("Draw")
	
	numbers = [0,0,0,0,0,0,0,0,0,0,0,0]
	
	var numbersNode = get_node("Numbers")
	var numberCount = numbersNode.get_child_count()
	
	for i in range(numberCount):
		numbers[i] = numbersNode.get_child(i)
	
	main = get_node("/root/Main")
	
func _process(delta):
	accumulatedResultTime += delta
	lastTime += delta
	
	if main.gameResult == main.WIN and resultCoinIndex != -1:
		processWin(delta)
	elif main.gameResult == main.DRAW:
		processDraw(delta)
	else:
		processLose(delta)

func processWin(delta):
	if lastTime >= numberShowTime:
		numbers[showNumberIndex].hide()
		showNumberIndex += 1
		lastTime = 0
	
	if showNumberIndex >= numbers.size():
		showNumberIndex = 0
		
	numbers[showNumberIndex].show()
		
	if accumulatedResultTime > totalWinShowtTime and showNumberIndex == resultCoinIndex:
		set_process(false)
		accumulatedResultTime = 0
		showNumberIndex = -1
		resultCoinIndex = -1

func processLose(delta):
	if lastTime >= Lose_Draw_ShowTime:
		lose.hide()
		main.gameState = main.GAME_PLAY
	
func processDraw(delta):
	if lastTime >= Lose_Draw_ShowTime:
		draw.hide()
		main.gameState = main.GAME_PLAY
	
func run(judgement):
	resultCoinIndex = -1
	if judgement == main.WIN:
		resultCoinIndex = randi() % 12
	elif judgement == main.LOSE:
		lose.show()
	else:
		draw.show()

	accumulatedResultTime = 0
	lastTime = 0
	set_process(true);
