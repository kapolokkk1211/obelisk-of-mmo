## Init Game


extends Node2D

var character_ui_template = preload("res://Scene/CharUiBased.tscn")

func _ready() -> void:
	var player_ui : CharacterUi = character_ui_template.instantiate()
	player_ui.data = preload("res://Resource/Char/Cavalry.tres")
	player_ui.set_up()
	$CanvasLayer/FightSceneUi/CombatField.add_child(player_ui)
	$CanvasLayer/FightSceneUi.move_player_to_marker(player_ui,0)
	
	var monster_ui : CharacterUi = character_ui_template.instantiate()
	monster_ui.data = preload("res://Resource/Char/Mushroom.tres")
	monster_ui.set_up()
	$CanvasLayer/FightSceneUi/CombatField.add_child(monster_ui)
	$CanvasLayer/FightSceneUi.move_monster_to_marker(monster_ui, 5)
	
	$CanvasLayer/FightSceneUi.set_up_hand()
