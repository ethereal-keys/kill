extends Node2D

const Ammo = preload("res://ammo.tscn")
export var neck_speed = 4
export var jump_speed = 20
onready var Neck = $Body/Catapult
const SPEED = 400
var ammo_speed
export var one = true setget player_setter
var hp = 5

func _ready():
	pass

func _physics_process(delta):
	pass
	

func fire():
	var boulder = Ammo.instance()
	boulder.make_boulder()
	boulder.set_mask(one)
	boulder.global_position = $Body/Catapult/LaunchPoint.global_position
	boulder.rotation_degrees = Neck.rotation_degrees + 90
	boulder.set_velocity(ammo_speed)
	get_tree().current_scene.add_child(boulder)

func set_angle():
	if one == true:
		if Input.is_action_pressed("player1_up"):
			Neck.rotation_degrees += neck_speed
		if Input.is_action_pressed("player1_down"):
			Neck.rotation_degrees -= neck_speed
	else:
		if Input.is_action_pressed("player2_up"):
			Neck.rotation_degrees += neck_speed
		if Input.is_action_pressed("player2_down"):
			Neck.rotation_degrees -= neck_speed
	if one:
		Neck.rotation_degrees = clamp(Neck.rotation_degrees, -150, -55)
	else:
		Neck.rotation_degrees = clamp(Neck.rotation_degrees, -135, -40)

func make_boulder():
	pass

func player_setter(value):
	if value:
		ammo_speed = SPEED
		$Body.set_collision_layer_bit(2, true)
		$Body/Catapult/NeckBody.set_collision_layer_bit(2, true)
	else:
		ammo_speed = -SPEED
		$Body/Catapult.position.x = -1 * $Body/Catapult.position.x
		$Body/Catapult.rotation_degrees = -120
		$Body.set_collision_layer_bit(3, true)
		$Body/Catapult/NeckBody.set_collision_layer_bit(3, true)
	one = value

func jump():
	$Body.linear_velocity.y -= jump_speed

func _on_Body_body_entered(body):
	hp -= 1
	body.queue_free()
	if hp == 0:
		self.queue_free()
	
	

