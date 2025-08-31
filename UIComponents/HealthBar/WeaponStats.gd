extends Resource
class_name WeaponStats

@export_range(0, 5) var firing_cooldown := 0.5

@export_category('Attack')
@export var speed := 200
@export var damage := 5.0
@export var max_pierce := 1
@export var knockback_force := 1.0
@export var innacuracy := 10.0
