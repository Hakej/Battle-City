extends Area3D
class_name Explosion

func _ready():
	await get_tree().physics_frame
	await get_tree().physics_frame
	damage_bodies_in_range()

func damage_bodies_in_range():
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body is BreakableWallPart:
			var breakable_wall_part = body as BreakableWallPart
			breakable_wall_part.break_part()
	
	await GH.tween(self, "scale", Vector3(0.01, 0.01, 0.01), 0.2, true)
	
	queue_free()
