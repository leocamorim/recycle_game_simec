extends Node2D

onready var listaItens = Master.listaItens.duplicate()

var item1
var item2
var item3
var item4
var item5

func _ready():
	Master.labelScore = $labelScore
	$Player/Chat.visible = false
	$Player/hand.visible = false
	$Player/mascarahand.visible = false
	randomize()
	listaItens.shuffle()
#	$Player.txtPapelzinho = "Olá coleguinha!\n"

	$Player.txtPapelzinho = "Que tal testar seus conhecimentos? Pode me ajudar a separar esses lixos corretamente?"
	yield(get_tree().create_timer(3), "timeout")
	$button/AnimationPlayer.play("fadeIn")

func loadNewItems():
	if listaItens.size() > 4:
		$Esteira/AnimationPlayer.play("slideLeft")
		yield(get_tree().create_timer(0.2), "timeout")

#		LIMPA OS ITENS DENTRO DE CADA posItem
		for i in range(0, $Esteira/esteira2.get_child_count()):
			for _i in range(0, $Esteira/esteira2.get_child(i).get_child_count()):
				$Esteira/esteira2.get_child(i).get_child(_i).queue_free()

#		GERA NOVO RESIDUO DENTRO DE CADA posItem
		var randNum = randi() % listaItens.size()
		item1 = listaItens[randNum].instance()
		$Esteira/esteira2/posItem1.add_child(item1)
		listaItens.erase(listaItens[randNum])
	
		randNum = randi() % listaItens.size()
		item2 = listaItens[randNum].instance()
		$Esteira/esteira2/posItem2.add_child(item2)
		listaItens.erase(listaItens[randNum])
	
		randNum = randi() % listaItens.size()
		item3 = listaItens[randNum].instance()
		$Esteira/esteira2/posItem3.add_child(item3)
		listaItens.erase(listaItens[randNum])
	
		randNum = randi() % listaItens.size()
		item4 = listaItens[randNum].instance()
		$Esteira/esteira2/posItem4.add_child(item4)
		listaItens.erase(listaItens[randNum])
	
		randNum = randi() % listaItens.size()
		item5 = listaItens[randNum].instance()
		$Esteira/esteira2/posItem5.add_child(item5)
		listaItens.erase(listaItens[randNum])
	else:
		Routes.endGame()
		pass

func _on_TouchScreenButton_released():
	Master.playButtonAudio()
	if not $button/AnimationPlayer.is_playing():
		$button/AnimationPlayer.play("fadeOut")
		$animGeral.play("fadeIn")
		yield($animGeral, "animation_finished")
		Master.is_playing = true
		loadNewItems()
		$Player.txtPapelzinho = "Arraste cada um dos resíduos para o local correto!"
