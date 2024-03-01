extends Node

var Hammer : bool = false
var Rock : bool = false
var Key : bool = false
var bodySeen : bool = false
var hasKnife : bool = false
var hasWine : bool = false
var hasPoison : bool = false
var cutOpen : bool = false
var hasCake : bool = false
var hasMotive : bool = false
var hasGun : bool = false
var windowBroken : bool = false
var metSuspects : bool = false
var WineTalk : bool = false
var CakeTalk : bool = false
var EndGame : bool = false

signal my_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	my_signal.connect(test)

func test():
	get_tree().change_scene_to_file("res://endingscene.tscn")
	print("Signal emitted")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
