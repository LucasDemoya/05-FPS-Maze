extends Control


func _ready():
	pass

func _on_Quit_pressed():
	var _signal = get_tree().change_scene("res://UI/End_Game.tscn")

