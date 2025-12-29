extends CharacterBody3D
class_name Rocket

@export var speed = 1000.0

var shooter : Node3D
var is_exploding = false

@export var explosion_scene : PackedScene

func _physics_process(delta):
	var direction = -global_transform.basis.z
	velocity = direction * speed * delta
	
	move_and_slide()

func _on_hitbox_body_entered(body):
	print("name:" + body.name)
	if body == shooter:
		return
	
	if is_exploding:
		return
	
	explode()

func explode():
	is_exploding = true
	var explosion = explosion_scene.instantiate()
	get_tree().root.add_child(explosion)
	
	explosion.global_position = global_position
	
	queue_free()
