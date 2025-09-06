extends RigidBody3D
class_name bullet_entity
## Class used for standard bullet script, passes the guns damage into the attack component of the bullet

@onready var attack_comp: AttackComponent = $AttackComponent

var gun_base_damage: int

func _ready() -> void:
	if attack_comp:
		attack_comp.hit_damage = gun_base_damage

# Used to remove the instantiated object when no longer on screen
# Will likely need changing as bullets should hit enemies off screen
func _on_visible_on_screen_enabler_3d_screen_exited() -> void:
	queue_free()
