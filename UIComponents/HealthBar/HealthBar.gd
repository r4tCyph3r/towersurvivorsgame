extends MarginContainer
class_name HealthBar
## Used for displaying the current health of the player, receives signals from selected health component

@onready var bar: TextureProgressBar = $Background/hSplit5050/Gauge
@export var health: HealthComponent

func _ready() -> void:
	if health:
		health.connect('update_health_HUD', update)
	
	bar.value = health.max_health

func update(number):
	bar.value = number
