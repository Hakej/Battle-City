extends Node

func find_child_of_type(node : Node, child_type : String) -> Node:
	var children = node.find_children("*", child_type)
	if children.size() != 0:
		return children[0]
	else:
		return null

func find_component(node : Node, child_type : String) -> Node:
	return find_child_of_type(node, child_type)

func tween(object : Object, property : NodePath, amount : Variant, duration : float, wait : bool = false):
	if object == null:
		return
	
	var tween_object = create_tween()
	tween_object.tween_property(object, property, amount, duration).set_trans(Tween.TRANS_SINE)
	
	if wait:
		await tween_object.finished

func print_authority_info(node):
	print("#####")
	print("perspective: " + str(node.multiplayer.get_unique_id()))
	print("is server: " + str(node.multiplayer.is_server()))
	print("node of: " + str(node.get_multiplayer_authority()))
	print("has authority: " + str(node.is_multiplayer_authority()))
	print("^^^^^")

func get_random_index(array : Array):
	return randi_range(0, array.size() - 1)
