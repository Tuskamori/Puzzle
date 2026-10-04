extends Area3D

@onready var locked_door: AudioStreamPlayer = $LockedDoor

var locked: bool = true

func interact():
	if locked:
		print("It's locked")
		locked_door.play()
	else:
		get_tree().quit()
