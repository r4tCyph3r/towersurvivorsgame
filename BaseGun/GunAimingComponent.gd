extends Area3D
class_name GunAimingComponent

var close_enemies = []

func _on_body_entered(body):
	if body.owner.is_in_group('enemy'):
		close_enemies.append(body)

func _on_body_exited(body):
	close_enemies.erase(body)
	
func _physics_process(delta: float) -> void:
		var target_enemy = get_closest_enemy()
		
		if target_enemy:
			var target_position = target_enemy.global_position
			var direction = Vector3(target_position.x - global_position.x, 0, target_position.z - global_position.z)
			if direction.length() > 0 and target_position != global_position:
				look_at(global_position + direction, Vector3.UP)

func get_closest_enemy():
	if close_enemies.size() == 0:
		return null

	var closest = null
	var closest_distance = INF

	for enemy in close_enemies:
		var distance_squared = global_position.distance_squared_to(enemy.global_position)
		if distance_squared < closest_distance:
			closest = enemy
			closest_distance = distance_squared
	return closest
