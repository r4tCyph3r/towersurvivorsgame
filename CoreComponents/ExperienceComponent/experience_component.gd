extends Node3D
class_name ExperienceComponent
# Component responsible for handling player experience calculations and signaling HUD to change


# Custom signals
signal update_xp_HUD
signal player_level_up


var current_xp: float
var max_xp: float
var current_level: int


func _ready() -> void:
	current_xp = 0
	current_level = 0
	max_xp = 100
	
	if owner.is_in_group('player'):
		var pickup = owner.find_child('PickupComponent')
		pickup.connect("xp_picked_up", update_xp)

func update_xp_percent():
	var xp_percent = current_xp / max_xp * 100
	if current_xp >= max_xp:
		level_up()
	
	emit_signal("update_xp_HUD", current_xp, max_xp, xp_percent)

func level_up():
	current_level += 1
	current_xp = current_xp - max_xp
	max_xp = max_xp * 1.1
	emit_signal('player_level_up', current_level)

func update_xp(received):
	current_xp += received
	update_xp_percent()
