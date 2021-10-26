extends Node2D

signal goal_reached

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("goal_reached")
	

