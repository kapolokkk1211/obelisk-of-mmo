extends Control
class_name CharacterUi

var char_runtime : CharacterRuntime

func set_up() -> void:
	name = char_runtime.data.char_name
	$ProgressBar.max_value = char_runtime.data.max_hp
	$ProgressBar.value = char_runtime.current_hp
	$Sprite2D.texture = char_runtime.data.sprite_dir
	
	char_runtime.hp_changed.connect(_update_hp)
	
func _update_hp(hp : int):
	$ProgressBar.value = hp
