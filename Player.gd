extends Node2D

enum {GIRAFFE, MONKEY, SNAKE}
export var one = true
var animal
export var hp = 5

func _ready():
	set_spawn()
	make_animal()

func _physics_process(delta):
	animal.set_angle()
	if one:
		player_one_input()
	else:
		player_two_input()
		

func player_one_input():
	if Input.is_action_just_pressed("player1_fire"):
			animal.fire()
	if Input.is_action_pressed("player1_right"):
		animal.position.x += 10
	if Input.is_action_pressed("player1_left"):
		animal.position.x -= 10
	if Input.is_action_just_pressed("player1_jump"):
		animal.jump()

func player_two_input():
	if Input.is_action_just_pressed("player2_fire"):
			animal.fire()
	if Input.is_action_pressed("player2_right"):
		animal.position.x += 10
	if Input.is_action_pressed("player2_left"):
		animal.position.x -= 10
	if Input.is_action_just_pressed("player2_jump"):
		animal.jump()

func make_animal():
	var animal_type = Initiate.get_player_one()
	var Animal
	match animal_type:
		GIRAFFE:
			Animal = preload("res://Giraffe.tscn")
		MONKEY:
			Animal = preload("res://Monkey.tscn")
		SNAKE:
			Animal = preload("res://Snake.tscn")
	animal = Animal.instance()
	if one:
		animal.one = true
	else:
		animal.one = false
	add_child(animal)

func set_spawn():
	if one:
		global_position = Vector2(260, 380)
	else:
		global_position = Vector2(800, 380)
