extends Area

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		queue_free()


func _on_Zombie_finished():
	var sound = get_node_or_null("/root/Game/Enemy/Zombie")
	if sound != null:
		sound.playing = true
	
