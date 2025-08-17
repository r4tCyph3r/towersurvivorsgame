extends CharacterBody3D
class_name MovementComponent
# Component to apply forces depending on criteria to characters in the game
# Modifiers are to be applied in here but not set within this component


## Defined for usage in the event the states are to be different
@export_group("Movement Applications")
@export var can_move : bool = true
@export var has_gravity : bool = true
@export var move_speed : float = 7.0

var input_dir: Vector2 = Vector2.ZERO
var enemy = null
var is_enemy: bool
var is_player: bool

func _ready() -> void:
	if owner.is_in_group('player'):
		is_player = true
	elif owner.is_in_group('enemy'):
		is_enemy = true
		enemy = $EnemyControllerComponent
	else:
		print('No group assigned')

func _physics_process(delta: float):
	
	var move_dir: Vector3 = Vector3.ZERO
	
	### Apply gravity to velocity
	if has_gravity:
		if not is_on_floor():
			velocity += get_gravity() * delta
	
	
	### Check for player or AI and set controls
	if is_player:
		if input_dir != Vector2.ZERO:
			move_dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	elif is_enemy:
		move_dir = (enemy.get_player_location() - global_position).normalized()
		
	
	# Apply desired movement to velocity
	if can_move:
			if move_dir:
				velocity.x = move_dir.x * move_speed
				velocity.z = move_dir.z * move_speed
			else:
				velocity.x = move_toward(velocity.x, 0, move_speed)
				velocity.z = move_toward(velocity.z, 0, move_speed)
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()


func velocity_debug():
	if velocity:
		print(owner, ' : ', velocity)
