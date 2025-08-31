extends Node3D
class_name PickableComponent
# Component responsible for handling object movement and destroying when picked up

@export var pull_power: float

var player_loc
var player_speed
var pickupcomp
var in_pull_range: bool = false

func _ready() -> void:
	for object in get_tree().get_nodes_in_group('player'):
		if object:
			player_loc = object.find_child('MovementComponent')
			pickupcomp = player_loc.find_child('PickupComponent')
			player_speed = player_loc.move_speed

func on_picked():
	in_pull_range = true

func _physics_process(_delta: float) -> void:
	if in_pull_range == true:
		var a = self.global_transform.origin
		var b = player_loc.global_position
		owner.set_linear_velocity((b-a)*(player_speed*1.2))

func _on_body_entered(body: Node3D) -> void:
	if pickupcomp:
		pickupcomp.on_picked_up(owner)
		owner.queue_free()
