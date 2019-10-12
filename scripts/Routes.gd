extends Node

func _ready():
	pass

func mainMenu():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func newGame():
	get_tree().change_scene("res://scenes/Game.tscn")

func teach():
	get_tree().change_scene("res://scenes/Teaching.tscn")

func endGame():
	get_tree().change_scene("res://scenes/EndGame.tscn")

func quit():
	get_tree().quit()
