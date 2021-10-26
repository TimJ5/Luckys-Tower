extends Node2D

#Check FPS
func _process(delta):
	OS.set_window_title("Lucky's Tower - FPS: " + str(Engine.get_frames_per_second()))




func _on_Goal_goal_reached():
	yield(get_tree().create_timer(5),"timeout")
	get_tree().quit()
