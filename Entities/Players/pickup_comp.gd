extends Area3D
class_name PickupComponent

signal xp_picked_up

func on_picked_up(item):
	if item is ExperienceCube:
		emit_signal("xp_picked_up", item.xp_value)

func _on_body_entered(body: Node3D) -> void:
	print(body)
	if body.find_child('PickableComponent'):
		var pickable = body.find_child('PickableComponent')
		pickable.in_pull_range = true

func _on_body_exited(body: Node3D) -> void:
	if body.find_child('PickableComponent'):
		var pickable = body.find_child('PickableComponent')
		pickable.in_pull_range = false
