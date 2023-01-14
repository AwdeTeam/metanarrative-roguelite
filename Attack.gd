extends Area2D


export (int) var damage = 1
export (float) var lifetime = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	# Check if the body is damageable
	if body.has_method("take_damage"):
		# If so, call the take_damage function
		body.take_damage(damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check if the lifetime is over
	if lifetime <= 0:
		# If so, remove the node
		queue_free()
	else:
		# If not, decrease the lifetime
		lifetime -= delta
