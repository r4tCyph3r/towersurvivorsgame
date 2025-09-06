extends CanvasLayer
class_name DebugHUD

## Directly Referencing due to ease of use rather than building a full debug panel
@onready var xp_label: Label = $PanelContainer/MarginContainer/VBoxContainer/XP_Label
@onready var level_label: Label = $PanelContainer/MarginContainer/VBoxContainer/Level_Label
@onready var hp_label: Label = $PanelContainer/MarginContainer/VBoxContainer/HP_Label
@onready var xp_percent_label: Label = $PanelContainer/MarginContainer/VBoxContainer/XP_Percent_Label

var xp_pretext: String = "XP: "
var hp_pretext: String = "HP: "
var level_pretext: String = "Level: "

@export var health: HealthComponent
@export var exp: ExperienceComponent

func _ready() -> void:
	exp.update_xp_HUD.connect(update_xp)
	health.update_health_HUD.connect(update_health)
	exp.player_level_up.connect(update_level)

func update_health(current_hp, max_hp):
	hp_label.text = hp_pretext + "%.2f" % current_hp + "/" + "%.2f" % max_hp

func update_xp(current_xp, max_xp, xp_percent):
	xp_label.text = xp_pretext + "%.2f" % current_xp + "/" + "%.2f" % max_xp
	xp_percent_label.text = xp_pretext + "%.2f" % xp_percent + "%"

func update_level(current_level):
	level_label.text = level_pretext + str(current_level)
