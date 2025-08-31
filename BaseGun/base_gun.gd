extends Node3D
class_name Gun
# Base class for all guns handles cooldown, bullet creation.

@onready var bullet_spawn_point: Marker3D = $GunAimingComponent/Marker3D
@onready var cooldown_timer: Timer = $CooldownTimer


@export var bullet : PackedScene
@export var stats : WeaponStats


var bullet_speed


func _ready() -> void:
	cooldown_timer.wait_time = stats.firing_cooldown
	cooldown_timer.timeout.connect(on_cooldown_timer_finished)
	bullet_speed = stats.speed

func on_cooldown_timer_finished():
	spawn_bullet()

func spawn_bullet():
	# Spawns bullet at marker and apply force
	var projectile = bullet.instantiate()
	projectile.gun_base_damage = stats.damage
	get_tree().root.add_child(projectile)
	
	projectile.global_transform = bullet_spawn_point.global_transform
	projectile.linear_velocity = bullet_spawn_point.global_transform.basis.z * -1 * bullet_speed
