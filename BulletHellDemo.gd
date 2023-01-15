extends Node2D

export (int) var arrowrate = 1

var player = null
var arrowtick = 0
var arrowScene = preload("res://Arrow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/BulletHellDemo/Player")

# Creates a Vector2 at a random position on the edge of the screen
func random_point_on_edge():
	var x = 0
	var y = 0
	var side = randi() % 4
	if side == 0:
		x = rand_range(0, get_viewport_rect().size.x)
	elif side == 1:
		x = get_viewport_rect().size.x
		y = rand_range(0, get_viewport_rect().size.y)
	elif side == 2:
		y = get_viewport_rect().size.y
		x = rand_range(0, get_viewport_rect().size.x)
	else:
		y = rand_range(0, get_viewport_rect().size.y)
	return Vector2(x, y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if arrowtick <= 0:
		var arrow = arrowScene.instance()
		var arrowScript = arrow.get_children()[0]
		add_child(arrow)
		# Get a random position on the edge of the screen
		var global_position = Vector2(0, 0)
		# Point the arrow at the player
		arrowScript.direction = (player.global_position - global_position).normalized()
		arrow.rotation = arrowScript.direction.angle()
		arrowtick = arrowrate
	else:
		arrowtick -= delta
