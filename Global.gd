extends Node

var score = 0


func _ready():
	pause_mode = PAUSE_MODE_PROCESS		# global should never be paused

func _unhandled_input(event):
	if event.is_action_pressed("menu"):	# instead of quitting, show the menu
		#get_tree().quit()
		var menu = get_node_or_null("/root/Game/Menu")
		if menu != null:
			if not menu.visible:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				menu.show()
				get_tree().paused = true 	# pause the game while the menu is visible
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				menu.hide()
				get_tree().paused = false
