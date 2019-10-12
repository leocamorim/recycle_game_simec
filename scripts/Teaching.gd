extends Node2D

var imgRed = preload("res://assets/red.png")
var imgGreen = preload("res://assets/green.png")
var imgYellow = preload("res://assets/yellow.png")
var imgBrown = preload("res://assets/brown.png")
var imgGray = preload("res://assets/gray.png")
var imgOrange = preload("res://assets/orange.png")

var aulaAtual = 5 setget changeClass

var item1
var item2
var item3
var item4
var item5

var lixosScreen = 3

func _ready():
	changeClass(0)

func _process(delta):
	if lixosScreen <= 0:
		_on_TouchScreenButton_released()

func _on_TouchScreenButton_released():
	if not $button/AnimationPlayer.is_playing():
		$button/AnimationPlayer.play("fadeOut")
		self.aulaAtual += 1

func changeClass(_newClass):
	
	aulaAtual = _newClass
	
	if aulaAtual == 0:
		Master.is_playing = false
		$Player.txtPapelzinho = "Olá coleguinha! Que bom ver você aqui. Vamos aprender a cuidar do nosso planeta?"
		yield(get_tree().create_timer(3), "timeout")
		$button/AnimationPlayer.play("fadeIn")

	elif aulaAtual == 1:
		$Player.txtPapelzinho = "A coleta seletiva é a separação de LIXOS e RESÍDUOS para facilitar a reciclagem."
		yield(get_tree().create_timer(1.5), "timeout")
		$button/AnimationPlayer.play("fadeIn")

	elif aulaAtual == 2:
		$Player.txtPapelzinho = "E é muito simples! Basta jogar o lixo certo no lugar certo. É como um jogo!"
		yield(get_tree().create_timer(1.5), "timeout")
		$button/AnimationPlayer.play("fadeIn")

	elif aulaAtual == 3:
		$posItem1.visible = false
		$posItem2.visible = false
		$posItem3.visible = false
		lixosScreen = 3
		$lata/AnimationPlayer.play("fadeIn")
		yield($lata/AnimationPlayer, "animation_finished")
		$Player.txtPapelzinho = "Vamos aprender um pouco?\nEsta é a LIXEIRA AZUL\ne nela jogamos PAPEL.\nJogue o lixo fora!"
		yield(get_tree().create_timer(2.5), "timeout")
		item1 = Master.itemAviaoPapel.instance()
		$posItem1.add_child(item1)
		$posItem1/AnimationPlayer.play("fadeIn")
		yield($posItem1/AnimationPlayer, "animation_finished")
		item2 = Master.itemPapelAmassado.instance()
		$posItem2.add_child(item2)
		$posItem2/AnimationPlayer.play("fadeIn")
		yield($posItem2/AnimationPlayer, "animation_finished")
		item3 = Master.itemCaixaPapelao.instance()
		$posItem3.add_child(item3)
		$posItem3/AnimationPlayer.play("fadeIn")
		yield($posItem3/AnimationPlayer, "animation_finished")

	elif aulaAtual == 4:
		$posItem1.visible = false
		$posItem2.visible = false
		$posItem3.visible = false
		lixosScreen = 3
		$animGeral.play("fadeOut")
		yield($animGeral, "animation_finished")
		$lata.type = "plastic"
		$lata/sprite.texture = imgRed
		$lata/AnimationPlayer.play("fadeIn")
		yield($lata/AnimationPlayer, "animation_finished")
		$Player.txtPapelzinho = "Esta é a LIXEIRA VERMELHA\ne nela jogamos PLÁSTICO.\n\nJogue o lixo fora!"
		yield(get_tree().create_timer(2.5), "timeout")
		item1 = Master.itemPlasticoSalgadinho.instance()
		$posItem1.add_child(item1)
		$posItem1/AnimationPlayer.play("fadeIn")
		yield($posItem1/AnimationPlayer, "animation_finished")
		item2 = Master.itemCopoPlastico.instance()
		$posItem2.add_child(item2)
		$posItem2/AnimationPlayer.play("fadeIn")
		yield($posItem2/AnimationPlayer, "animation_finished")
		item3 = Master.itemGarrafaPet.instance()
		$posItem3.add_child(item3)
		$posItem3/AnimationPlayer.play("fadeIn")
		yield($posItem3/AnimationPlayer, "animation_finished")

	elif aulaAtual == 5:
		$posItem1.visible = false
		$posItem2.visible = false
		$posItem3.visible = false
		lixosScreen = 3
		$animGeral.play("fadeOut")
		yield($animGeral, "animation_finished")
		$lata.type = "common"
		$lata/sprite.texture = imgGray
		$lata/AnimationPlayer.play("fadeIn")
		yield($lata/AnimationPlayer, "animation_finished")
		$Player.txtPapelzinho = "Esta é a LIXEIRA CINZA\ne nela jogamos RESÍDUOS NÃO RECICLÁVEIS.\nJogue o lixo fora!"
		yield(get_tree().create_timer(2.5), "timeout")
		item1 = Master.itemBanana.instance()
		$posItem1.add_child(item1)
		$posItem1/AnimationPlayer.play("fadeIn")
		yield($posItem1/AnimationPlayer, "animation_finished")
		item2 = Master.itemMaca.instance()
		$posItem2.add_child(item2)
		$posItem2/AnimationPlayer.play("fadeIn")
		yield($posItem2/AnimationPlayer, "animation_finished")
		item3 = Master.itemMelancia.instance()
		$posItem3.add_child(item3)
		$posItem3/AnimationPlayer.play("fadeIn")
		yield($posItem3/AnimationPlayer, "animation_finished")

	elif aulaAtual == 6:
		$posItem1.visible = false
		$posItem2.visible = false
		$posItem3.visible = false
		lixosScreen = 3
		$animGeral.play("fadeOut")
		yield($animGeral, "animation_finished")
		$lata.type = "metal"
		$lata/sprite.texture = imgYellow
		$lata/AnimationPlayer.play("fadeIn")
		yield($lata/AnimationPlayer, "animation_finished")
		$Player.txtPapelzinho = "Esta é a LIXEIRA AMARELA\ne nela jogamos METAL.\n\nJogue o lixo fora!"
		yield(get_tree().create_timer(2.5), "timeout")
		item1 = Master.itemCano.instance()
		$posItem1.add_child(item1)
		$posItem1/AnimationPlayer.play("fadeIn")
		yield($posItem1/AnimationPlayer, "animation_finished")
		item2 = Master.itemPorca.instance()
		$posItem2.add_child(item2)
		$posItem2/AnimationPlayer.play("fadeIn")
		yield($posItem2/AnimationPlayer, "animation_finished")
		item3 = Master.itemLataSardinha.instance()
		$posItem3.add_child(item3)
		$posItem3/AnimationPlayer.play("fadeIn")
		yield($posItem3/AnimationPlayer, "animation_finished")

	elif aulaAtual == 7:
		$posItem1.visible = false
		$posItem2.visible = false
		$posItem3.visible = false
		lixosScreen = 3
		$animGeral.play("fadeOut")
		yield($animGeral, "animation_finished")
		$lata.type = "dangerous"
		$lata/sprite.texture = imgOrange
		$lata/AnimationPlayer.play("fadeIn")
		yield($lata/AnimationPlayer, "animation_finished")
		$Player.txtPapelzinho = "Esta é a LIXEIRA LARANJA\ne nela jogamos RESÍDUOS PERIGOSOS.\nJogue o lixo fora!"
		yield(get_tree().create_timer(2.5), "timeout")
		item1 = Master.itemBanana.instance()
		$posItem1.add_child(item1)
		$posItem1/AnimationPlayer.play("fadeIn")
		yield($posItem1/AnimationPlayer, "animation_finished")
		item2 = Master.itemMaca.instance()
		$posItem2.add_child(item2)
		$posItem2/AnimationPlayer.play("fadeIn")
		yield($posItem2/AnimationPlayer, "animation_finished")
		item3 = Master.itemMelancia.instance()
		$posItem3.add_child(item3)
		$posItem3/AnimationPlayer.play("fadeIn")
		yield($posItem3/AnimationPlayer, "animation_finished")

	else:
		$animGeral.play("fadeOut")
		yield($animGeral, "animation_finished")
		Routes.newGame()

func _on_TouchScreenButton2_button_up():
#	$Player.txtPapelzinho = ''
#	$posItem1/AnimationPlayer.play("fadeOut")
#	$posItem2/AnimationPlayer.play("fadeOut")
#	$posItem3/AnimationPlayer.play("fadeOut")
#	$lata/AnimationPlayer.play("fadeOut")
#	$button/AnimationPlayer.play("fadeOut")
#	$animGeral.play("fadeOut")
#	yield($animGeral, "animation_finished")
	Routes.newGame()
