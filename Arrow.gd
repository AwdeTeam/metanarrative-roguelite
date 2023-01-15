extends KinematicBody2D

export (int) var health = 1
export (int) var speed = 8

var player = null
export (Vector2) var direction = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Created arrow")
	player = get_node("/root/BulletHellDemo/Player")

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()

func _process(delta):
	var collision = move_and_collide(direction * speed)
	if collision:
		if collision.collider.name == "Player":
			collision.collider.take_damage(1)
		queue_free()
