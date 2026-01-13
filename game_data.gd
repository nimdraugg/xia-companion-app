extends Node

var player_names: Array[String] = []

enum LocationType {
	ANOMALY,
	NEBULA,
	LAWFUL,
	ASTEROIDS,
	PIRATE,
	GATES,
	ICE,
	DEAD,
	DEBRIS,
	NEUTRAL
}

enum LawType {
	GRAY,
	BLUE,
	GREEN,
	RED
}

var locations_data: Dictionary = {
	"Blench": {
		"location_type": LocationType.ICE,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Calakus": {
		"location_type": LocationType.DEAD,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Ferren's Call": {
		"location_type": LocationType.ANOMALY,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Kiln": {
		"location_type": LocationType.NEUTRAL,
		"law_type": LawType.GREEN,
		"enabled": false
	},
	"Neo-Vostok": {
		"location_type": LocationType.ICE,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Ruins of Drelmoth": {
		"location_type": LocationType.DEAD,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Samara Gate": {
		"location_type": LocationType.GATES,
		"law_type": LawType.BLUE,
		"enabled": false
	},
	"Tafjur": {
		"location_type": LocationType.DEAD,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"The Brink": {
		"location_type": LocationType.NEUTRAL,
		"law_type": LawType.GREEN,
		"enabled": false
	},
	"The Chasm": {
		"location_type": LocationType.ANOMALY,
		"law_type": LawType.RED,
		"enabled": false
	},
	"The Grinder": {
		"location_type": LocationType.ICE,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Вихрь-86": {
		"location_type": LocationType.NEBULA,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Врата \"Дельтас\"": {
		"location_type": LocationType.GATES,
		"law_type": LawType.BLUE,
		"enabled": false
	},
	"Врата \"Тигр\"": {
		"location_type": LocationType.PIRATE,
		"law_type": LawType.RED,
		"enabled": false
	},
	"Врата \"Экспедиор\"": {
		"location_type": LocationType.GATES,
		"law_type": LawType.BLUE,
		"enabled": false
	},
	"Доравин V": {
		"location_type": LocationType.NEUTRAL,
		"law_type": LawType.GREEN,
		"enabled": false
	},
	"Кемплар II": {
		"location_type": LocationType.LAWFUL,
		"law_type": LawType.BLUE,
		"enabled": false
	},
	"Красное ущелье": {
		"location_type": LocationType.ASTEROIDS,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Креллер IV": {
		"location_type": LocationType.DEBRIS,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Крепость": {
		"location_type": LocationType.DEBRIS,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Лазурь": {
		"location_type": LocationType.NEUTRAL,
		"law_type": LawType.GREEN,
		"enabled": false
	},
	"Логово Контрабандистов": {
		"location_type": LocationType.PIRATE,
		"law_type": LawType.RED,
		"enabled": false
	},
	"Лунария": {
		"location_type": LocationType.LAWFUL,
		"law_type": LawType.BLUE,
		"enabled": false
	},
	"Нео-Дамаск": {
		"location_type": LocationType.NEUTRAL,
		"law_type": LawType.GREEN,
		"enabled": false
	},
	"Нижняя Облачность": {
		"location_type": LocationType.NEBULA,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Огненная Лошадь": {
		"location_type": LocationType.NEBULA,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Острог": {
		"location_type": LocationType.PIRATE,
		"law_type": LawType.RED,
		"enabled": false
	},
	"ТК-421": {
		"location_type": LocationType.ASTEROIDS,
		"law_type": LawType.GRAY,
		"enabled": false
	},
	"Форпост-338": {
		"location_type": LocationType.ASTEROIDS,
		"law_type": LawType.GRAY,
		"enabled": false
	},
}
