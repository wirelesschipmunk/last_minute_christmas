extends CharacterBody2D

var grabbed_object
var painted_object

var is_painting = false

@export var colors = [
	Color("#fe5444"), 
	Color("#fc8000"), 
	Color("#fbd700"), 
	Color("#0ca40a"), 
	Color("#477aef"), 
	Color("#30206a"), 
	Color("#df5997"), 
	Color("#000000"), 
]

var brush = preload("res://sprites/paintbrush.png")
var active_color = Color(255, 255, 255)

func _process(delta):
	position = get_global_mouse_position()
	
	if grabbed_object:
		grabbed_object.position = position
		if Input.is_action_just_pressed("rotate"):
			grabbed_object.rotation_degrees += 45
		if Input.is_action_just_released("grab"):
			grabbed_object = null
			
	if is_painting:
		$Sprite2D.texture = brush
	else:
		$Sprite2D.texture = null
			
	if painted_object and is_painting:
		if Input.is_action_pressed("paint"):
#			print("paints")
#			print(painted_object)
			painted_object.modulate = active_color
		if Input.is_action_just_released("paint"):
			painted_object = null

func _on_cube_grabbed(object):
	if not is_painting:
		grabbed_object = object
		
func _on_cube_painted(object):
	painted_object = object

func _on_button_button_down():
	if not grabbed_object:
		is_painting = not is_painting


func _on_red_button_down():
	active_color = colors[0]
	print(active_color)


func _on_orange_button_down():
	active_color = colors[1]
	print(active_color)


func _on_yellow_button_down():
	active_color = colors[2]
	print(active_color)


func _on_green_button_down():
	active_color = colors[3]
	print(active_color)


func _on_blue_button_down():
	active_color = colors[4]
	print(active_color)


func _on_pink_button_down():
	active_color = colors[5]
	print(active_color)


func _on_purple_button_down():
	active_color = colors[6]
	print(active_color)


func _on_black_button_down():
	active_color = colors[7]
	print(active_color)
