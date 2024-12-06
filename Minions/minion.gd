extends Node2D

var velocity: Vector2 = Vector2(0,0)

func one_or_minusone():
	return (((randi()%2)*2)-1)
	
func randf_range_or_neg(start: float, end: float):
	return randf_range(start, end) * one_or_minusone()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.global_position = Vector2(
		randf_range(0, get_viewport_rect().size.x),
		randf_range(0, get_viewport_rect().size.y)
	)
	velocity = Vector2(
		randf_range_or_neg(100, 200),
		randf_range_or_neg(100, 200)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Movement
	self.global_position = self.global_position + velocity * delta
	# Rotation
	self.global_rotation = velocity.angle()
	# Reflection
	if self.global_position.x < 0:
		self.global_position.x = -self.global_position.x
		velocity = velocity * Vector2(-1, 1)
	elif self.global_position.x > get_viewport_rect().size.x:
		self.global_position.x = get_viewport_rect().size.x - (get_viewport_rect().size.x - self.global_position.x)
		velocity = velocity * Vector2(-1, 1)
	if self.global_position.y < 0:
		self.global_position.y = -self.global_position.y
		velocity = velocity * Vector2(1, -1)
	elif self.global_position.y > get_viewport_rect().size.y:
		self.global_position.y = get_viewport_rect().size.y - (get_viewport_rect().size.y - self.global_position.y)
		velocity = velocity * Vector2(1, -1)
	
