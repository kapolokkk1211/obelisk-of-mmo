extends TextureButton
class_name CardUi

signal card_ui_pressed(card_ui : CardUi)

var data : CardData

func set_up():
	if data.texture:
		$CardTexture.texture = data.texture
	#### For future texture
	
	$CardName.text = data.card_name
	$CardDetail.text = data.card_detail
	$DamageLabel.text = str(data.card_dmg)
	$ManaLabel.text = str(data.card_mana_cost)

func _pressed() -> void:
	card_ui_pressed.emit(self)
	
func set_selected(value: bool):
	if value:
		scale = Vector2(1.1, 1.1)
		button_pressed = true
	else:
		scale = Vector2.ONE
		button_pressed = false

func execute(target : CharacterUi):
	if target:
		target.hurt(data.card_dmg)
	else:
		print("no valid target")
