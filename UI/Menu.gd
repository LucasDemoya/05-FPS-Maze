extends Control


func _ready():
	pass

func _on_Quit_pressed():
	var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	
