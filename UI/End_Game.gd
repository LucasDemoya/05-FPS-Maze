extends Control


func _ready():
	get_tree().paused = false 


func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://UI/Main_Menu.tscn")
	

func _on_Quit_pressed():
	get_tree().quit()
