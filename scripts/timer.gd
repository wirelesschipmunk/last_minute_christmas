extends Label

func _process(delta):
	text = str($Timer.time_left).pad_decimals(2) + "s"
