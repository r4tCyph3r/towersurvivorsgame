extends Node3D
class_name HealthComponent
## Component use to calculate health values and send signals when certain thresholds are met (e.g. 0 health > died)
## also controls the Player Grace Timer (PGT)

@export var max_health: int = 100
var current_health: int


@onready var PGT: Timer = $PlayerGraceTimer


signal no_health


func _ready() -> void:
	current_health = max_health

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		print(PGT.time_left)

func add_health(value: int):
	current_health += value
	
	if current_health > max_health:
		current_health = max_health

func remove_health(value: int):
	if owner.is_in_group('player'):
		if not PGT.is_stopped():
			return
		else:
			PGT.start()
	
	current_health -= value
	
	if current_health <= 0:
		on_zero_health()
	
	print(self, ' Current Health: ', current_health)

func on_zero_health():
	current_health = 0
	emit_signal('no_health')
