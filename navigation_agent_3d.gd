extends NavigationAgent3D
class_name EnemyController
# Used to track the player and send inputs to the movment component


var player = null


func _ready() -> void:
	for object in get_tree().get_nodes_in_group('player'):
		if object:
			player = object.find_child('MovementComponent')

func get_player_location():
		self.set_target_position(player.global_position)
		var next_nav_point = self.get_next_path_position()
		return next_nav_point
