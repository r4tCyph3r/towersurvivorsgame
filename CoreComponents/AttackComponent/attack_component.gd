extends Area3D
class_name AttackComponent
## Component used to detect collision with hitbox component and pass an Attack value in

@export var hit_damage: int

func _ready() -> void:
	pass

# Area used to detect hitboxes entering
func _on_area_entered(area: Area3D) -> void:
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		
		var attack = Attack.new()
		attack.attack_damage = hit_damage
		hitbox.damage(attack)
