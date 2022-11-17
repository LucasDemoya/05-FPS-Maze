extends Node

var menu = null
var VP = Vector2.ZERO
var score = 0
var lives = 5

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")
	reset()

func reset():
	score = 0
	lives = 5

func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		if menu == null:
			menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null: 
			if not menu.visible:
				get_tree().paused = true
				menu.show()
			else:
				get_tree().paused = false
				menu.hide()



func _resize():
	VP = get_viewport().size

func update_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/UI/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)

func update_lives(l):
	lives += l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var Lives = get_node_or_null("/root/Game/UI/HUD/Lives")
	if Lives != null:
		for c in Lives.get_children():
			c.queue_free()
		var Life = load("res://UI/Life.tscn")
		for l in range(lives):
			var life = Life.instance()
			var starting = Lives.rect_size.x - (40*(l+1))
			life.position.x = starting
			Lives.add_child(life)
