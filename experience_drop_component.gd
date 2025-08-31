extends Node3D
class_name ExperienceSpawnComponent
## Component used for dropping experience

@onready var spawner: EnemySpawningComponent = %EnemySpawningComponent

func _ready() -> void:
	spawner.connect('enemy_spawned', new_enemy)

func new_enemy(enemy):
	enemy = enemy.find_child('HealthComponent')
	enemy.connect('enemy_died', drop_xp)

func drop_xp(enemy):
		var xpcube = preload("res://experience.tscn")
		var xpdrop = xpcube.instantiate()
		var enemy_death_location = enemy.find_child('MovementComponent').global_position
		get_tree().root.add_child(xpdrop)
		xpdrop.global_position = enemy_death_location
