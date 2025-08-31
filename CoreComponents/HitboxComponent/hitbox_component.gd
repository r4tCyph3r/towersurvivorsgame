extends Area3D
class_name HitboxComponent
## Used for recieving confirmation of being hit and passing damage variables to the health component

@export var health_component : HealthComponent

func damage(attack: Attack):
	if health_component:
		health_component.on_damage(attack)
