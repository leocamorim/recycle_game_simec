extends Area2D

onready var initial_position = position
var canMove = false
var dragMouse = false

var onCan = false
var can

export(String) var type

func _process(delta):
#	FUNCAO DE ARRASTE PELO MOUSE
	if(dragMouse):
		set_global_position(get_viewport().get_mouse_position() - $colisao.position)

func _on_garrafaVidro_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse = true
		else: 
			dragMouse = false
			onRelease()

func onRelease():

	if onCan:
		if can.is_in_group("can"):
			can.droppedItem(self)
		else:
			position = Vector2()
	else:
		position = Vector2()

func _on_item_area_entered(area):
	if area.is_in_group("can"):
		onCan = true
		can = area

func _on_item_area_exited(area):
	if area.is_in_group("can"):
		onCan = false
		can = null
