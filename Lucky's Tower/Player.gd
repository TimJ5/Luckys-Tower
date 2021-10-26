extends KinematicBody2D

#Movement variables
const UP_DIRECTION = Vector2.UP
var GRAVITY = 2000
var speed = 300
var velocity = Vector2.ZERO
var jump_strength = 0
var max_jump = 1300
var player_scale = 2

func _ready():
	set_physics_process(false)
	
	
func _physics_process(delta):
	
	var h_direction = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	var snap = Vector2.DOWN * 20 if is_on_floor() else Vector2.ZERO
	
	if h_direction == 0 and is_on_floor():
		$AnimationPlayer.play("Idle")
	
	if h_direction != 0 and is_on_floor():
		$Sprite.scale.x = h_direction * player_scale
		$AnimationPlayer.play("Walk")
	
	if Input.is_action_pressed("jump") and is_on_floor():
		$AnimationPlayer.play("Jump")
		h_direction = 0
		jump_strength += 25 
		jump_strength = clamp(jump_strength, 0, max_jump)
		
	if Input.is_action_just_released("jump"):
		$AnimationPlayer.stop()
		$Sprite.frame = 14
		velocity.y += -jump_strength
		jump_strength = 0
	
	
	velocity.x = h_direction * speed
	velocity.y += GRAVITY * delta

	velocity = move_and_slide_with_snap(velocity, snap, UP_DIRECTION)

func _on_Menu_game_start():
	set_physics_process(true)
