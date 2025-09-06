extends Node3D
class_name PlayerStatsComponent
## Component used when initialising the player to set the default values before the level starts

@export_category("Stats")
@export var max_health: int
@export var base_speed: float

func _ready() -> void:
	pass

func increase_max_health(amount):
	max_health = max_health * amount

func increase_base_speed(amount):
	base_speed = base_speed * amount
