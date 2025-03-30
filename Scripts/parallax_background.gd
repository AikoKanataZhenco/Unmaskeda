extends ParallaxBackground

var speed = 100

func _process(_delta):
	scroll_offset.x += speed * _delta
	if scroll_offset.x > 1600:
		scroll_offset.x = 0
	elif scroll_offset.x < -1600:
		scroll_offset.x = 0
