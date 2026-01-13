extends Control

@onready var players_names_cont = $MarginContainer/VBoxContainer/players_names_cont
@onready var add_field_b = $MarginContainer/VBoxContainer/add_field_b
@onready var confirm_b = $MarginContainer/VBoxContainer/confirm_b
@onready var message_label = $MarginContainer/VBoxContainer/limit_l
@onready var timer = $Timer

func _on_add_field_b_pressed() -> void:
	var new_field = HBoxContainer.new()
	var new_line_edit = LineEdit.new()
	var new_delete_b = Button.new()
	var max_fields = 5
	
	
	if players_names_cont.get_child_count() >= max_fields:
		message_label.text = "Достигнут лимит игроков!"
		timer.start()
		return
	else:
		new_line_edit.placeholder_text = "Имя игрока"
		new_line_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		new_line_edit.alignment = HORIZONTAL_ALIGNMENT_CENTER
		new_delete_b.text = "X"
		
		new_field.add_child(new_line_edit)
		new_field.add_child(new_delete_b)
		players_names_cont.add_child(new_field)
		new_delete_b.pressed.connect(func(): _on_new_delete_b_pressed(new_field))



func _on_timer_timeout() -> void:
	message_label.text = " "
	
func _on_new_delete_b_pressed(field_to_delete: HBoxContainer):
	field_to_delete.queue_free() 

func _on_confirm_b_pressed() -> void:
	game_data.player_names.clear()
	for field in players_names_cont.get_children():
		var line_edit = field.get_child(0)
		var player_name = line_edit.text.strip_edges()
		if player_name != "":
			game_data.player_names.append(player_name)
	print("Сохранено игроков: ", game_data.player_names.size())
	print("Имена: ", game_data.player_names)
	get_tree().change_scene_to_file("res://main_menu.tscn")
