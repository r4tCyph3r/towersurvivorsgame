extends Node3D
class_name EnemySpawningComponent

var locations: Array = []

signal enemy_spawned

func _ready() -> void:
	pass

func new_enemy():
	var enemy_scene = preload("res://Entities/Enemies/enemy.tscn")
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.global_position = select_spawn()
	emit_signal("enemy_spawned", enemy)

func select_spawn():
	for loc in get_tree().get_nodes_in_group('SpawnLocation'):
		locations.append(loc.global_position)
	var selected_location = locations.pick_random()
	locations.clear()
	return selected_location

func _on_spawn_timer_timeout() -> void:
	new_enemy()
