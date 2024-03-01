extends AnimatedSprite2D

var MouseInArea: bool = false
var alpha = 1.0
@onready var animated_sprite : AnimatedSprite2D = self
@export var defaultSprite = 0
@export var highlightedSprite = 1
#@export var IsCollectable = false
#@export var text = "Insert Text Here"
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
const Balloon = preload("res://Dialogue/balloon.tscn")

signal labelDisplay (labelText)
signal labelHide()

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.frame = defaultSprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton && MouseInArea == true:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				var balloon: Node = Balloon.instantiate()
				get_tree().current_scene.add_child(balloon)
				balloon.start(dialogue_resource, dialogue_start)
			else:
				print("Left button was released")


func _on_area_2d_mouse_entered():
	MouseInArea = true
	animated_sprite.frame = highlightedSprite


func _on_area_2d_mouse_exited():
	MouseInArea = false
	animated_sprite.frame = defaultSprite
