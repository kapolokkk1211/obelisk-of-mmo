# Control combat
## Know UI

extends Node2D
class_name CombatManager

@onready var fight_scene_ui = $"../CanvasLayer/FightSceneUi"
@onready var state_manager : StateManager = $"../StateManager"

var player : CharacterRuntime
var monster : CharacterRuntime

var current_select_card : CardUi

func _ready() -> void:
	fight_scene_ui.card_selected.connect(_on_card_pressed)
	
func set_up(
	p : CharacterRuntime,
	m : CharacterRuntime
	):
	player = p
	monster = m
	p.died.connect(_on_player_died)
	m.died.connect(_on_monster_died)

func _on_card_pressed(card_ui : CardUi):
	state_manager.set_state(state_manager.State.PLAYER_AIM_TARGET)
	current_select_card = card_ui

func _input(event: InputEvent) -> void:
	if state_manager.game_state != state_manager.State.PLAYER_AIM_TARGET:
		return
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var target : CharacterRuntime
		target = fight_scene_ui.find_monster_on_position(get_global_mouse_position())
		current_select_card.execute(target)
		state_manager.set_state(state_manager.State.TURN_RESOLVING)


func _on_monster_died():
	print("YOU WIN")
func _on_player_died():
	print("YOU LOSE")
