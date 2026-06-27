extends RefCounted
class_name CharacterRuntime

var data : CharacterData

signal hp_changed(current_hp : int)
signal died

var current_hp : int

func _init(charcter_Data : CharacterData):
	data = charcter_Data
	current_hp = data.max_hp
	
func hurt(dmg : int):
	current_hp -= dmg
	hp_changed.emit(current_hp)
	is_dead()

func is_dead():
	if current_hp <= 0:
		died.emit()
