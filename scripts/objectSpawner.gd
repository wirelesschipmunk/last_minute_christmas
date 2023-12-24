extends Marker2D

var imgs = [
	preload("res://sprites/circle.png"), 
	preload("res://sprites/donut.png"), 
	preload("res://sprites/gear.png"), 
	preload("res://sprites/quarter.png"), 
	preload("res://sprites/screw.png"), 
	preload("res://sprites/spring.png"), 
	preload("res://sprites/square.png"), 
	preload("res://sprites/stick.png"), 
	preload("res://sprites/triangle.png"),
]

var object_scene = preload("res://scenes/cube.tscn")

var rotations = [ 0, 90, 180, 270 ]

func _on_spawn_rate_timeout():
	var object_instance = object_scene.instantiate()
	
	object_instance.grabbed.connect($"../hand"._on_cube_grabbed)
	object_instance.painted.connect($"../hand"._on_cube_painted)
	
	object_instance.position = position
	object_instance.get_child(0).texture = imgs[randi_range(0, imgs.size() - 1)]
	object_instance.rotation_degrees = rotations[randi_range(0, 3)]
	$"../objects".add_child(object_instance)
	
