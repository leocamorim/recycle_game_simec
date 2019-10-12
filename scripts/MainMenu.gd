extends Node2D

var timer = 0
var timer_limit = 5

var listaFalas = Master.listaFalas.duplicate()

func _ready():
	randomize()
	$Player/AnimationPlayer.play("fadeIn")
	$animGeral.play("fadeIn")
	randFala()

func _process(delta):
	timer += delta
	if timer >= timer_limit:
		timer = 0
		randFala()

func randFala():
	var randNum = rand_range(0, listaFalas.size())
	listaFalas.shuffle()
	listaFalas.shuffle()
	$Player.txtPapelzinho = listaFalas[randNum]

func _on_btPlay_released():
	Master.playButtonAudio()
	$animGeral.play("fadeOut")
	yield($animGeral, "animation_finished")
	Routes.teach()

func _on_btExit_released():
	Master.playButtonAudio()
	$animGeral.play("fadeOut")
	yield($animGeral, "animation_finished")
	Routes.quit()
