extends Control

@onready var mission_label = $VBoxContainer/HBoxContainer/name
@onready var target_1 = $VBoxContainer/HBoxContainer2/target_1
@onready var todo_1 = $VBoxContainer/HBoxContainer3/todo_1
@onready var target_2 = $VBoxContainer/HBoxContainer4/target_2
@onready var todo_2 = $VBoxContainer/HBoxContainer5/todo_2
@onready var reward = $VBoxContainer/HBoxContainer6/reward

func _ready() -> void:
	generate_mission()

enum Lawful {
	HEADHUNTER,
	PASSENGER,
	TRANSFER,
	HELP,
	SCIENTIST,
	CARGO,
	DETECTIVE
}

enum pirate {
	BOOM,
	THIEF,
	COERCE,
	ARMS_DEALER,
	DEALER,
	CONTRABANDIST,
	ASSASSIN
}

func generate_mission():
	var lawful = Lawful.values().pick_random()
	match lawful:
		lawful.HEADHUNTER:
			mission_label.text = "БУМ!"
		lawful.PASSENGER:
			mission_label.text = "Перевозка пассажиров"
		lawful.TRANSFER:
			mission_label.text = "Перевозка груза"
		lawful.HELP:
			mission_label.text = "Помощь"
		lawful.SCIENTIST:
			mission_label.text = "Учёный"
		lawful.CARGO:
			mission_label.text = "Добыча"
		lawful.DETEVTIVE:
			mission_label.text = "Частный детектив"
