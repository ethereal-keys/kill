extends Node

enum {GIRAFFE, MONKEY, SNAKE}
var player = {"player1" : GIRAFFE, "player2" : GIRAFFE}
var player1_hp = 5 setget update_player1
var player2_hp = 5 setget update_player2

func _ready():
	pass # Replace with function body.

func get_player_one():
	return player["player1"]

func get_player_two():
	return player["player2"]

func get_hp():
	return [player1_hp, player2_hp]

func update_player1(value):
	player1_hp = value

func update_player2(value):
	player2_hp = value
