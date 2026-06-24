extends Node
class_name StateManager

enum State {
	PLAYER_SELECT_CARD,
	PLAYER_AIM_TARGET,
	TURN_RESOLVING
}

var game_state : State = State.PLAYER_SELECT_CARD

func set_state(new_state : State) -> void:
	game_state = new_state
	match game_state:
		State.PLAYER_SELECT_CARD:
			print("STATE PL SL C")
			Input.set_custom_mouse_cursor(null)
			
		State.PLAYER_AIM_TARGET:
			print("STATE P A T")
			Input.set_custom_mouse_cursor(preload("res://Asset/Reticle.png"))
			
		State.TURN_RESOLVING:
			print("STATE RSV")
			Input.set_custom_mouse_cursor(null)
