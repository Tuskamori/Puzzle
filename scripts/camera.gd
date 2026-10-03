extends Camera3D

func _process(_delta: float) -> void:
	if $Ray.get_collider() and $Ray.get_collider().has_method("interact"):
		$"../Reticule/Pickup".visible = true
		if Input.is_action_just_pressed("E"):
			$Ray.get_collider().interact()
	else:
		$"../Reticule/Pickup".visible = false
