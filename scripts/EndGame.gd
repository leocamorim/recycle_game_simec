extends Node2D

onready var labelPremio = ''

func _ready():
	for _i in range(0, Master.ptsPremios.size()):
		if Master.score >= int(Master.ptsPremios[str(_i)]):
			labelPremio = Master.premios[str(_i)]
	if labelPremio != '':
		$message.text = Master.preTxtPremio + '\n' + labelPremio
	else:
		$message.text = Master.txtSemPremio

	$labelScore.text = str(Master.score) + ' pts.'

	Master.playWinAudio()
	$congrats/AnimationPlayer.play("fadeIn")
	yield($congrats/AnimationPlayer, "animation_finished")
	$labelScore/AnimationPlayer.play("fadeIn")
	yield($labelScore/AnimationPlayer, "animation_finished")
	$message/AnimationPlayer.play("fadeIn")
	yield($message/AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("fadeIn")

func _on_btRestart_released():
	Master.playButtonAudio()
	Routes.mainMenu()
