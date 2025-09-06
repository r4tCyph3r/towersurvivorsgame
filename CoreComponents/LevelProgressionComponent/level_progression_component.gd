extends Node3D
class_name LevelProgressionComponent
## Component for progressing the duration of the level and scaling modifiers based on time

signal LevelDifficultyIncreased

@onready var second_timer: Timer = $SecondTimer

var level_time_seconds: int
var level_time_minutes: int
var level_time_hours: int
var level_time: String
var base_difficulty: int = 1

func _ready() -> void:
	level_time_seconds = 0
	level_time_minutes = 0
	level_time_hours = 0

func _on_level_timer_timeout() -> void:
	level_time_seconds += 10
	
	if level_time_seconds == 60:
		level_time_seconds = 0
		level_time_minutes += 1
	
	if level_time_minutes == 60:
		level_time_minutes = 0
		level_time_hours += 1
	
	level_time = "%02d" % level_time_hours + ":%02d" % level_time_minutes + ":%02d" % level_time_seconds
	
	print(level_time)
