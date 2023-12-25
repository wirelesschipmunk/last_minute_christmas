extends Node2D

var toys = [
	preload("res://scenes/car.tscn"),
	preload("res://scenes/robo.tscn"),
	preload("res://scenes/gnome.tscn"),
	preload("res://scenes/firetruck.tscn"),
]

var toy_instance

var is_paused = false

func _ready():
	toy_instance = toys.pick_random().instantiate()
	toy_instance.position = Vector2(942, 422)
	toy_instance.scale = Vector2(3.5, 3.5)
	$".".add_child(toy_instance)

func _on_timer_timeout():
	var all_objects = $objects.get_children()
	var toy_parts = toy_instance.get_children()
	
	var objects = []
	var possible_points = toy_parts.size() * 18
	var points = 0
	
	# removes items on convyer
	for obj in all_objects:
		if obj.is_on_convyer:
			continue
		else:
			objects.append(obj)
	
	print(objects)
	for part in toy_parts:
		var part_img = part.texture
		var part_color = part.modulate
		
		for obj in objects:
			var obj_img = obj.get_child(0).texture
			var obj_color = obj.modulate
			print(part_color, obj_color)
			
			if obj_img == part_img:
				print("right part")
				points += 9
				
			if obj_color == part_color:
				print("right color")
				points += 9
			
			if obj_img == part_img or obj_color == part_color:
				objects.erase(obj)
				toy_parts.erase(part)
				
	print(points)
#	get_tree().reload_current_scene()
				


