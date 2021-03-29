extends KinematicBody

var velocity = Vector3.ZERO
var speed = 0.001
var max_speed = 0.1 

func _physics_process(_delta):
	translation.x = clamp(translation.x, -1.5, 1.5)
	translation.z = clamp(translation.z, -1, 1)
	if abs(translation.x) == 1.5:
		velocity.x = 0
	if abs(translation.z) == 1:
		velocity.z = 0
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("forward"):
		velocity.z -= speed
	if Input.is_action_pressed("back"):
		velocity.z += speed
	velocity = velocity.normalized() * clamp(velocity.length(), -max_speed, max_speed)
	var _m = move_and_collide(velocity)
