extends Node3D
class_name PlayerStatsComponent
## Component used when initialising the player to set the default values before the level starts

@export_category("Stats")
@export var max_health: int
@export var base_speed: float

func _ready() -> void:
	pass
