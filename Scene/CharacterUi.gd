extends Control
class_name CharacterUi

var data : CharacterData

func set_up() -> void:
	name = data.char_name
	$ProgressBar.max_value = data.max_hp
	$ProgressBar.value = data.max_hp
	$Sprite2D.texture = data.sprite_dir

func hurt(dmg):
	data.max_hp -= dmg
	print(name, " take ", dmg, " dmg")
	_update_hp()
	if data.max_hp <= 0:
		self.visible = false
	
func _update_hp():
	$ProgressBar.value = data.max_hp
