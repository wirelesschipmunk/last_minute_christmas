extends Area2D

var can_be_grabbed = false
var is_on_convyer = true

var speed = 540

signal grabbed(object)
signal painted(object)

func _process(delta):
	if can_be_grabbed and Input.is_action_just_pressed("grab"):
		grabbed.emit($".")
	
	if can_be_grabbed and Input.is_action_just_pressed("paint") and not is_on_convyer:
		painted.emit($".")
	
	if is_on_convyer:
		position.x += speed * delta
		
	if position.x > 1300:
		$".".queue_free()
		
		
func _on_body_entered(body):
	can_be_grabbed = true

func _on_body_exited(body):
	can_be_grabbed = false
