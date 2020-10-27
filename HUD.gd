extends Node2D

var hp

func _ready():
	hp = Initiate.get_hp()
	$Player1.text = "PLAYER 1 HP : " + str(hp[0])
	$Player2.text = "PLAYER 2 HP : " + str(hp[1])

func update_labels():
	hp = Initiate.get_hp()
	$Player1.text = "PLAYER 1 HP : " + str(hp[0])
	$Player2.text = "PLAYER 2 HP : " + str(hp[1])
