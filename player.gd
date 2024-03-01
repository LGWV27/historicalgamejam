extends CharacterBody2D


@export var speed : float = 200.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var label : Label = $Label
@onready var timer : Timer = $Label/Timer

var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO

func _ready():
	label.set_visible_characters(0)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
		if direction.x != 0:
			animated_sprite.play("Walk")
		else:
			animated_sprite.play("Idle")

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true


func _on_area_2d_area_entered(area):
	label.set_text("I can't leave the crime scene yet.")
	label.set_visible_characters(-1)
	timer.start(3)
	print("entered side area")
	


func _on_area_2d_area_exited(area):
	pass


func _on_timer_timeout():
	label.set_visible_characters(0)
	#TODO - Change label to fade in / out


func _on_dead_body_label_display(labelText):
	label.set_text(labelText)
	label.set_visible_characters(-1)


func _on_dead_body_label_hide():
	label.set_visible_characters(0)


func _on_window_mouse_entered():
	label.set_text("A window")
	label.set_visible_characters(-1)
	timer.start(3)


func _on_mouse_mouse_entered():
	label.set_text("A mouse")
	label.set_visible_characters(-1)
	timer.start(3)


func _on_suspects_mouse_entered():
	label.set_text("Speak with the killers")
	label.set_visible_characters(-1)
	timer.start(3)


func _on_rock_mouse_entered():
	label.set_text("A rock.")
	label.set_visible_characters(-1)
	timer.start(3)


func _on_area_2d_mouse_entered():
	label.set_text("Rasputin's body")
	label.set_visible_characters(-1)
	timer.start(3)
