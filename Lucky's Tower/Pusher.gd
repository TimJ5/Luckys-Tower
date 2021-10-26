extends KinematicBody2D

enum direction {Up = 0, Down = 1, Left = 2, Right = 3}

#var start_pos = $Head.position
export var push_direction = direction.Right
export var push_strength = 500
var movement = Vector2.ZERO


func _on_Detector_body_entered(body):
	if body.get_name() == "Player":

		match push_direction:
			0:
				movement.y += -push_strength
			1:
				movement.y += push_strength
			2:
				movement.x += -push_strength
			3:
				movement.x += push_strength
				
		$Head.position = move_and_collide(movement)
