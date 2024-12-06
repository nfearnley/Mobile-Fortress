extends Node2D

@onready var bomber_minion = preload("res://Minions/Bomber.tscn")
@onready var fighter_minion = preload("res://Minions/Fighter.tscn")
@onready var drone_minion = preload("res://Minions/Drone.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(2000):
		self.add_child(bomber_minion.instantiate())
		self.add_child(fighter_minion.instantiate())
		self.add_child(drone_minion.instantiate())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
