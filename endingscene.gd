extends Node

@onready var label : Label = $Label
@onready var timer : Timer = $Timer
@onready var timer2 : Timer = $Timer2
@onready var label2 : Label = $Label2
@onready var label3 : Label = $Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(3)
	timer2.start(6)
	label2.set_visible_characters(0)
	label3.set_visible_characters(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	label2.set_visible_characters(-1)


func _on_timer_2_timeout():
	label3.set_visible_characters(-1)
