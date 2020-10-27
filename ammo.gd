extends Node2D


func _ready():
	pass

func make_boulder():
	$RigidBody2D/Sprite.scale = Vector2(4, 4)
	$RigidBody2D/CollisionShape2D.scale = Vector2(4, 4)

func set_velocity(speed):
	var velocity = Vector2(speed * cos(rotation), speed * sin(rotation))
	$RigidBody2D.linear_velocity = velocity


func _on_RigidBody2D_body_entered(body):
	if body.get_collision_layer_bit(2):
		Initiate.player1_hp -= 1
		get_node("/root/Hud").update_labels()
		if Initiate.player1_hp == 0:
			get_tree().get_root().get_node("/root/World/Player1").queue_free()
			
	if body.get_collision_layer_bit(3):
		Initiate.player2_hp -= 1
		get_node("/root/Hud").update_labels()
		if Initiate.player2_hp == 0:
			get_tree().get_root().get_node("/root/World/Player2").queue_free()
	
	self.queue_free()

func set_mask(player_one):
	if player_one:
		$RigidBody2D.set_collision_mask_bit(3, true)
	else:
		$RigidBody2D.set_collision_mask_bit(2, true)
