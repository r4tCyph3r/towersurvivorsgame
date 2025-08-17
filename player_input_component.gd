extends Node3D
class_name PlayerInputComponent
# Class for handling all of the players inputs / keybinds

# References child nodes that are called within the script
@onready var move: CharacterBody3D = $MovementComponent

## Maps player input and checks that they are mapped
# Player Controller Component
# Directions named relevant to camera
@export_group("Input Actions")
@export var input_left : String = "move_left"
@export var input_right : String = "move_right"
@export var input_up : String = "move_up"
@export var input_down : String = "move_down"
@export var input_interact: String = 'interact'
@export var mouse_sens : float = 0.002

var input_dir: Vector2
var mouse_captured: bool = false

func _ready():
	check_keybinds()

func _unhandled_input(event: InputEvent) -> void:
	## Used during debug stage for tabbing in and out
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture_mouse()
	if Input.is_key_pressed(KEY_ESCAPE):
		release_mouse()

func _process(delta: float) -> void:
	## Calculates vector2 based on directional inputs from player
	input_dir = Input.get_vector(input_left, input_right, input_up, input_down)
	move.input_dir = input_dir

## Checks if some Input Actions haven't been created.
func check_keybinds():
	# Pushes errors if any inputs are not mapped
	if not InputMap.has_action(input_left):
		push_error("Movement disabled. No InputAction found for input_left: " + input_left)
	if not InputMap.has_action(input_right):
		push_error("Movement disabled. No InputAction found for input_right: " + input_right)
	if not InputMap.has_action(input_up):
		push_error("Movement disabled. No InputAction found for input_forward: " + input_up)
	if not InputMap.has_action(input_down):
		push_error("Movement disabled. No InputAction found for input_back: " + input_down)

## Locks mouse to the window
func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

## Releases mouse from the window
func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false
