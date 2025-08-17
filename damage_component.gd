extends Area3D
class_name DamageComponent
## Used to calculate damage amounts and then send a calculation to the health component to deduce

@export var base_damage: int

func _ready() -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if owner.is_in_group('enemy'):
		damage_player(body)
	else:
		pass

func damage_player(body):
	if body.find_child('HealthComponent'):
		var player_health = body.find_child('HealthComponent')
		player_health.remove_health(base_damage)
