extends KinematicBody2D

var attackScene = preload("res://Attack.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Face the mouse
	var mouse_pos = get_global_mouse_position()
	var mouse_dir = mouse_pos - get_global_position()
	var angle = mouse_dir.angle()
	rotation = angle

func _unhandled_input(event):
	# Attack with left click
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var attack = attackScene.instance()
		attack.position = position + rotation * Vector2(0, 60)
		attack.rotation = rotation
		get_parent().add_child(attack)
