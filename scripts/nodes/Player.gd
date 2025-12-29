extends CharacterBody3D
class_name Player

@export var speed := 6.0

@export var rocket_scene : PackedScene

@export_category("Local")
@export var tank_barrel : Node3D

var rocket : Rocket

func _physics_process(delta):
	velocity = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed * delta
	elif Input.is_action_pressed("move_left"):
		velocity.x = -(speed * delta)
	elif Input.is_action_pressed("move_down"):
		velocity.z = speed * delta
	elif Input.is_action_pressed("move_up"):
		velocity.z = -(speed * delta)
	
	if velocity:
		rotation.y = atan2(velocity.x, velocity.z) + PI
	
	move_and_slide()

func _input(event):
	if event.is_action_pressed("shoot"):
		if not rocket:
			shoot_rocket()

func shoot_rocket():
	rocket = rocket_scene.instantiate() as Rocket
	get_tree().root.add_child(rocket)
	
	rocket.global_position = global_position
	rocket.global_rotation = global_rotation
	rocket.shooter = self
