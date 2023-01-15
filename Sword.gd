extends KinematicBody2D

var attackScene = preload("res://Attack.tscn")
var rotationMatrix = Transform2D(0, Vector2(0, 0))
var sprite = null
var lifetime = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("Sprite")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Face the mouse
	var mouse_pos = get_global_mouse_position()
	var mouse_dir = mouse_pos - get_global_position()
	var angle = mouse_dir.angle()
	rotationMatrix = Transform2D(angle, Vector2(0, 0))
	rotation = angle

	if lifetime > 0:
		lifetime -= delta
		if lifetime <= 0:
			sprite.show()

func _unhandled_input(event):
	# Attack with left click
	if lifetime <= 0 and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var attack = attackScene.instance()
		lifetime = attack.get_children()[0].lifetime
		sprite.hide()
		attack.position = position + rotationMatrix.basis_xform(Vector2(90, 0))
		attack.rotation = rotation
		get_parent().add_child(attack)
