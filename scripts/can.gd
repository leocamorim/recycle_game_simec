extends Area2D

export(String) var type
export(Texture) var imagem = preload("res://assets/blue.png")

func _ready():
	$sprite.texture = imagem
	pass

func _on_lata_area_entered(item):
	$AnimationPlayer.play("expand")

func _on_lata_area_exited(area):
	$AnimationPlayer.play("decrease")

func droppedItem(item):
	if item.type == type:
		item.queue_free()
		Master.playCorrectAudio()
		if Master.is_playing:
			$star/AnimationPlayer.play("correct")
			Master.qntLixosCorretos += 1
			if Master.qntLixosCorretos % 5 <= 0:
				get_parent().loadNewItems()
			Master.addScore()
		else:
			get_parent().lixosScreen -= 1
	else:
		Master.playWrongAudio()
		item.position = Vector2()
		if Master.score > 0:
			Master.subScore()
