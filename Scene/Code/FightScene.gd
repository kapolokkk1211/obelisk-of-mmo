## Init Game
extends Node2D
class_name FightScene

@onready var combat_manager : CombatManager = $CombatManager

var player_data : CharacterData = preload("res://Resource/Char/Cavalry.tres")
var monster_data : CharacterData = preload("res://Resource/Char/Mushroom.tres")

var character_ui_template = preload("res://Scene/CharUiBased.tscn")

func _ready() -> void:
	var player_runtime : CharacterRuntime = CharacterRuntime.new(player_data)
	var player_ui : CharacterUi = character_ui_template.instantiate()
	player_ui.char_runtime = player_runtime
	player_ui.set_up()
	$CanvasLayer/FightSceneUi/CombatField.add_child(player_ui)
	$CanvasLayer/FightSceneUi.move_player_to_marker(player_ui,0)
	
	var monster_runtime : CharacterRuntime = CharacterRuntime.new(monster_data)
	var monster_ui : CharacterUi = character_ui_template.instantiate()
	monster_ui.char_runtime = monster_runtime
	monster_ui.set_up()
	$CanvasLayer/FightSceneUi/CombatField.add_child(monster_ui)
	$CanvasLayer/FightSceneUi.move_monster_to_marker(monster_ui, 5)
	
	combat_manager.set_up(player_runtime, monster_runtime)
	$CanvasLayer/FightSceneUi.set_up_hand()
