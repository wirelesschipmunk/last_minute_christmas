extends Control

var is_paused = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		is_paused = not is_paused
		
	get_tree().paused = is_paused
	
	if is_paused:
		show()
	else:
		hide()

func _on_resume_button_down():
	is_paused = false

func _on_quit_button_down():
	get_tree().quit()
