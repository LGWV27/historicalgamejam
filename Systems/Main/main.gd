extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func endGame():
	get_tree().change_scene_to_file("res://endingscene.tscn")


func _on_autoload_my_signal():
	get_tree().change_scene_to_file("res://endingscene.tscn")
