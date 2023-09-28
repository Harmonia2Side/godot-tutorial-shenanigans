extends Sprite2D

# func _init():
# 	print("Hello There!")

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_button_pressed():
	# Replace with function body.
	set_process(not is_processing())
