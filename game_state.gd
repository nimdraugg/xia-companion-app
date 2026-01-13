extends Node
class_name GameState

# какие внешние локации доступны
var unlocked_outer_locations: Dictionary = {
	# "edge": true,
	# "kreller_iv": true
}

# какие наборы включены
var enabled_sets: Dictionary = {
	"base": true,
	"expansion_1": false
}
