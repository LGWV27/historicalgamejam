extends AnimatedSprite2D

var MouseInArea: bool = false
var alpha = 1.0
@onready var animated_sprite : AnimatedSprite2D = self
@onready var label : Label = $Label
@onready var timer : Timer = $Label/Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	label.set_visible_characters(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton && MouseInArea == true:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				label.set_visible_characters(-1)
				timer.start(5)
				#TODO - Change label to fade in / out
			else:
				print("Left button was released")


func _on_area_2d_mouse_entered():
	MouseInArea = true
	animated_sprite.play("Highlighted")


func _on_area_2d_mouse_exited():
	MouseInArea = false
	animated_sprite.play("default")


func _on_timer_timeout():
	label.set_visible_characters(0)
	#TODO - Change label to fade in / out
	
