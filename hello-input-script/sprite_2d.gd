extends Sprite2D

# func _init():
# 	print("Hello There!")

var speed = 400
var angular_speed = PI

func _process(delta):
	# observe que #rotation é uma propriedade herdada
	
	# player input:
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1	 
	rotation += angular_speed * delta * direction
	
	# Para se mover em círculos
	# var velocity = Vector2.UP.rotated(rotation) * speed
	# position += velocity * delta
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN.rotated(rotation) * speed
	position += velocity * delta
