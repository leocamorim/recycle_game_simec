extends Node

var is_playing = false
var qntLixosCorretos = 0
var score = 0

onready var labelScore
onready var json = newLoadFile()
onready var addPontos = json.addPts
onready var subPontos = json.subPts
onready var ptsPremios = json.ptsPremios
onready var premios = json.premios
onready var preTxtPremio = json.preTxtPremio
onready var txtSemPremio = json.txtSemPremio

func _ready():
	print(addPontos)
	print(subPontos)
	print(ptsPremios)
	print(premios["0"])

func newLoadFile():
	var data_file = File.new()
	if data_file.open("res://data.json", File.READ) != OK:
		return

	var data_text = data_file.get_as_text()
	data_file.close()
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	var data = data_parse.result
	return data

func playButtonAudio():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load('res://assets/sound_button.wav')
	player.play()

func playCorrectAudio():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load('res://assets/sound_correct.wav')
	player.play()
	yield(player, "finished")
	player.queue_free()

func playWrongAudio():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load('res://assets/sound_wrong.wav')
	player.play()
	yield(player, "finished")
	player.queue_free()

func playWinAudio():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load('res://assets/sound_win.wav')
	player.play()
	playApplauseAudio()

func playApplauseAudio():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load('res://assets/applause.wav')
	player.play()

func addScore():
	score += addPontos
	labelScore.text = str(score) + ' pts.'

func subScore():
	score -= subPontos
	labelScore.text = str(score) + ' pts.'

# ITENS CARREGADOS SEPARADAMENTE E DEPOIS ADICIONADOS EM UM ARRAY TODOS JUNTOS
var itemAviaoPapel = preload("res://scenes/items/aviaoPapel.tscn")
var itemBanana = preload("res://scenes/items/banana.tscn")
var itemCacoVidro = preload("res://scenes/items/cacoVidro.tscn")
var itemCaixaPapelao = preload("res://scenes/items/caixaPapelao.tscn")
var itemCano = preload("res://scenes/items/cano.tscn")
var itemCopoPlastico = preload("res://scenes/items/copoPlastico.tscn")
var itemCopoVidro = preload("res://scenes/items/copoVidro.tscn")
var itemGarrafaPet = preload("res://scenes/items/garrafaPet.tscn")
var itemGarrafaVidro = preload("res://scenes/items/garrafaVidro.tscn")
var itemLataSardinha = preload("res://scenes/items/lataSardinha.tscn")
var itemMaca = preload("res://scenes/items/maca.tscn")
var itemMelancia = preload("res://scenes/items/melancia.tscn")
var itemPapelAmassado = preload("res://scenes/items/papelAmassado.tscn")
var itemPlasticoSalgadinho = preload("res://scenes/items/plasticoSalgadinho.tscn")
var itemPorca = preload("res://scenes/items/porca.tscn")

var listaItens = [
	itemAviaoPapel,
	itemBanana,
#	itemCacoVidro,
	itemCaixaPapelao,
	itemCano,
	itemCopoPlastico,
#	itemCopoVidro,
	itemGarrafaPet,
#	itemGarrafaVidro,
	itemLataSardinha,
	itemMaca,
	itemMelancia,
	itemPapelAmassado,
	itemPlasticoSalgadinho,
	itemPorca,
]

var listaFalas = [
	"Ajude-nos a salvar nosso planeta!",
	"O planeta Terra precisa de você!",
	"Seja um super-herói e ajude a salvar o nosso planeta!"
]