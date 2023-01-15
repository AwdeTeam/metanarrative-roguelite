extends Area2D


export (int) var damage = 1
export (float) var lifetime = 0.2
export (float) var ticktime = 0.1

var tick = 0.0

func check_collisions():
	# Loop through all nodes colliding with the Area2D
	for body in get_overlapping_bodies():
		# Check if the body is damageable
		if body.has_method("take_damage"):
			# If so, call the take_damage function
			body.take_damage(damage)
			print("Hit " + str(body) + " for " + str(damage) + " damage!")
	tick = ticktime

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Area2D ready")
	check_collisions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check if the lifetime is over
	if lifetime <= 0:
		# If so, remove the node
		queue_free()
	else:
		# If not, decrease the lifetime
		lifetime -= delta
	
	if tick <= 0:
		check_collisions()
	else:
		tick -= delta
