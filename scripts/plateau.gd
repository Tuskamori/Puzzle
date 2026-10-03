extends StaticBody3D

const CUBE = preload("uid://bauoirkvafhbx")

func _ready() -> void:
	for i in get_children():
		if i is StaticBody3D:
			var spawned_cube: Node = CUBE.instantiate()
			spawned_cube.connect("taken",i.collision_change)
			spawned_cube.position = Vector3(0,0.05,0)
			spawned_cube.value = i.value
			i.add_child(spawned_cube)
