extends Control

signal game_start

func _ready():
	$Label.hide()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("game_start")


func _on_Goal_goal_reached():
	$Label.show()
