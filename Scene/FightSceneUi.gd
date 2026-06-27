# Control UI

extends Control

signal card_selected(card_data : CardUi)
var current_selected_card_ui : CardUi

var player_markers : Array[Marker2D]
var monster_markers : Array[Marker2D]


func _ready() -> void:
	for each in $CombatField/PlayerMarker.get_children():
		player_markers.append(each)
	for each in $CombatField/MonsterMarker.get_children():
		monster_markers.append(each)
		
func move_player_to_marker(player_node : CharacterUi, slot : int):
	for each : BattlerMarker in player_markers:
		if each.slot_id == slot:
			player_node.global_position = each.global_position
			each.char_here = player_node
			
func move_monster_to_marker(monster_node : CharacterUi, slot : int):
	for each : BattlerMarker in monster_markers:
		if each.slot_id == slot:
			monster_node.global_position = each.global_position
			each.char_here = monster_node

func set_up_hand():
	for each in CardDb.deck_data_1:
		var new_card_scene : CardUi = preload("res://Scene/CardUiBased.tscn").instantiate()
		new_card_scene.data = each
		new_card_scene.set_up()
		new_card_scene.card_ui_pressed.connect(_on_card_ui_pressed)
		$BottomHUD/UIRow/Hand.add_child(new_card_scene)
		
func _on_card_ui_pressed(new_select_card_ui : CardUi):
	if current_selected_card_ui:
		current_selected_card_ui.set_selected(false)
		##DB
		$DebugLabels/SelectedCardState.text = str(current_selected_card_ui.data.card_name)
		if current_selected_card_ui == new_select_card_ui:
			current_selected_card_ui = null
			##DB
			$DebugLabels/SelectedCardState.text = ""
			return
			
	new_select_card_ui.set_selected(true)
	card_selected.emit(new_select_card_ui)
	current_selected_card_ui = new_select_card_ui
	##DB
	$DebugLabels/SelectedCardState.text = str(current_selected_card_ui.data.card_name)
	
func find_monster_on_position(input_position : Vector2) -> CharacterRuntime:
	return $CombatField.find_monster_on_input(input_position)
	
	
	
