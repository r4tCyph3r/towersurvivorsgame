extends Node3D
class_name HealthComponent
## Component use to calculate health values and send signals when certain thresholds are met (e.g. 0 health > died)
## also controls the Player Grace Timer (PGT)


signal update_health_HUD
signal enemy_died


@export var max_health: int = 100
var current_health: int
var PGT


func _ready() -> void:
	current_health = max_health
	if find_child('PlayerGraceTimer') != null:
		PGT = $PlayerGraceTimer

func on_heal(heal: int):
	current_health += heal
	
	if current_health > max_health:
		current_health = max_health
	
	emit_signal('update_health_HUD', current_health)

func on_damage(attack: Attack):
	
	if PGT:
		if not PGT.is_stopped():
			return
		else:
			PGT.start()
	
	current_health -= attack.attack_damage
	
	if current_health <= 0:
		on_zero_health()
	
	emit_signal('update_health_HUD', current_health)

func on_zero_health():
	if owner.is_in_group('enemy'):
		emit_signal("enemy_died", owner)
		owner.queue_free()
