extends Control

@onready var buttons_container = $ScrollContainer/screen_slider/players_menu/MarginContainer/players_buttons
@onready var scroll_container = $ScrollContainer
@onready var screen_slider = $ScrollContainer/screen_slider

func _init() -> void:
	pass

func _ready():
	await get_tree().process_frame
	var w = scroll_container.size.x
	for page in screen_slider.get_children():
		page.custom_minimum_size.x = w

	# Создание кнопок игроков
	for player_name in game_data.player_names:
		var button = Button.new()
		button.text = player_name
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.pressed.connect(func(): _on_player_button_pressed(player_name))
		buttons_container.add_child(button)
	
	# Подключение сигналов для локаций
	var locations_vbox = $ScrollContainer/screen_slider/locations_menu/MarginContainer/LocationsScrollContainer/VBoxContainer
	for i in range(1, 30):  # LocationRow1 до LocationRow29
		var row = locations_vbox.get_node_or_null("LocationRow" + str(i))
		if row:
			var checkbox = row.get_node_or_null("CheckBox")
			var label = row.get_node_or_null("Label")
			if checkbox and label:
				var location_name = label.text
				checkbox.toggled.connect(func(pressed): _on_location_toggled(pressed, location_name))

func _on_player_button_pressed(player_name: String):
	print("Нажата кнопка игрока: ", player_name)

func _on_location_toggled(button_pressed: bool, location_name: String):
	if location_name in game_data.locations_data:
		game_data.locations_data[location_name]["enabled"] = button_pressed
		print("Локация ", location_name, ": ", "включена" if button_pressed else "выключена")

func _on_scroll_container_scroll_ended():
	var scroll_h = scroll_container.scroll_horizontal
	var screen_width = scroll_container.size.x
	var target_page = round(scroll_h / screen_width)
	var target_position = target_page * screen_width
	
	var tween = create_tween()
	tween.tween_property(scroll_container, "scroll_horizontal", target_position, 0.2)
