extends Sprite2D

# func _init():
# 	print("Hello There!")

var speed = 400
var angular_speed = PI

func _process(delta):
	# observe que #rotation é uma propriedade herdada
	rotation += angular_speed * delta
	# Para se mover em círculos
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
