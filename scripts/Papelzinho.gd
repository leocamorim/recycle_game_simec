extends Node2D

var txtPapelzinho = "" setget txtSetFunc

func _ready():
	pass

func txtSetFunc(_new_value):
	if _new_value != "":
		$Chat.visible = true
	else:
		$Chat.visible = true
	printFala(_new_value)

func printFala(_fala):
	$txtFala.text = _fala
	if _fala != "":
		$fala.play("fala")
		for i in range(0, _fala.length()):
			$txtFala.visible_characters = i
			yield(get_tree().create_timer(0.025), "timeout")
		$fala.play("feliz")
