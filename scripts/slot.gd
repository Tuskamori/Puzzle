extends StaticBody3D

@export var value: int

func interact() -> void:
	if $"/root/Main/Hero".item:
		$"/root/Main/Hero".item.connect("taken",collision_change)
		$"/root/Main/Hero".item.reparent(self)
		$"/root/Main/Hero".item.position = Vector3(0,0.05,0)
		$"/root/Main/Hero".item.rotation = Vector3(0,0,0)
		value = $"/root/Main/Hero".item.value
		$"/root/Main/Hero".item = null
		if get_parent().has_method("update"):
			get_parent().update()
		collision_layer = 0

func collision_change() -> void:
	$"/root/Main/Hero".item.disconnect("taken",collision_change)
	collision_layer = 2
	value = 0
	if get_parent().has_method("update"):
		get_parent().update()
