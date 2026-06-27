extends Control


func find_monster_on_input(input_position : Vector2) -> CharacterRuntime:
	
	var closest_marker : BattlerMarker
	
	for each : BattlerMarker in $MonsterMarker.get_children():
		if closest_marker == null:
			closest_marker = each
		if input_position.distance_squared_to(closest_marker.global_position) > input_position.distance_squared_to(each.global_position):
			closest_marker = each
			
	
	return closest_marker.char_here.char_runtime
