extends Area2D

func _on_area_entered(area):
	area.is_on_convyer = true

func _on_area_exited(area):
	area.is_on_convyer = false
