extends MarginContainer
class_name EXPBar
## Used for displaying the current health of the player, receives signals from selected health component

@onready var bar: TextureProgressBar = $Background/hSplit5050/Gauge
@export var xp: ExperienceComponent

func _ready() -> void:
	if xp:
		xp.connect('update_xp_HUD', update)
	
	bar.value = 0

func update(number, level):
	bar.value = number
