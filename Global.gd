extends Node

const SAVE_PATH = "res://settings.cfg"
var save_file = ConfigFile.new()
var inputs = ["left","right","forward","back"]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	load_input()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if not menu.visible:
				menu.show()
				get_tree().paused = true
			else:
				save_input()
				menu.hide()
				get_tree().paused = false


func load_input():
	pass


func save_input():
	pass
