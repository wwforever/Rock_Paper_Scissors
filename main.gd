
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var centerimage
var dashboard
var coin = 10
var coinLabel

const TITLE_STATE = 0
const GAME_PLAY = 1
const GAME_RESULT = 2
const GAME_END = 3

const ROCK = 0
const SCISSORS = 1
const PAPER = 2

const LOSE = 0
const WIN = 1
const DRAW = 2

var gameState

func _ready():
	# Initialization here
	centerimage = get_node("BaseSprite/Center")
	dashboard = get_node("BaseSprite/Dashboard")
	coinLabel = get_node("BaseSprite/Node2D/Coin")
	coinLabel.set_text(var2str(coin))
	gameState = TITLE_STATE
	var tick = OS.get_ticks_msec()
	seed(tick)

func buttonPressed(index):
	if gameState != GAME_PLAY:
		return

	if (centerimage == null):
		return
		
	gameState = GAME_RESULT	
	var iJudgement = judgment(index, centerimage.set_run(false))
	dashboard.showDashBoard(iJudgement)
	if (iJudgement == 1):
		var resultCoinIndex = randi() % 12
		dashboard.setResultCoin(resultCoinIndex)
		
func judgment(btnIndex, showIndex):
	# rock
	if btnIndex == ROCK:
		#draw
		if showIndex == ROCK:
			return DRAW
		# win
		elif showIndex == SCISSORS:
			return WIN
		# lose
		else:
			return LOSE
	# scissors
	elif btnIndex == SCISSORS:
		#draw
		if showIndex == SCISSORS:
			return DRAW
		# win
		elif showIndex == PAPER:
			return WIN
		# lose
		else:
			return LOSE
	# papers
	else:
		#draw
		if showIndex == PAPER:
			return DRAW
		# win
		elif showIndex == ROCK:
			return WIN
		# lose
		else:
			return LOSE

func _on_btnRock_pressed():
	buttonPressed(0)

func _on_btnScissors_pressed():
	buttonPressed(1)

func _on_btnPaper_pressed():
	buttonPressed(2)

func _on_btnInsertCoin_pressed():
	if gameState != TITLE_STATE:
		return
		
	if coin <= 0:
		print("no coin")
		return
	
	coin = coin - 1
	coinLabel.set_text(var2str(coin))
	gameState = GAME_PLAY
	