extends StaticBody3D

var total: Array = []

@onready var door_unlock: AudioStreamPlayer = $"/root/Main/DoorUnlock"

func _ready() -> void:
	for i in get_children():
		if i is StaticBody3D:
			total.append(i.value)

func update() -> void:
	for i in range(len(total)):
		total[i] = get_child(i).value
	$Table/Line1.text = str(check_result(total,0))
	$Table/Line2.text = str(check_result(total,4))
	$Table/Line3.text = str(check_result(total,8))
	$Table/Line4.text = str(check_result(total,12))
	$Table/Line1R.text = str(check_result(total,3, -4, -1))
	$Table/Line2R.text = str(check_result(total,7, -4, -1))
	$Table/Line3R.text = str(check_result(total,11, -4, -1))
	$Table/Line4R.text = str(check_result(total,15, -4, -1))
	$Table/Col1.text = str(check_result(total,12, -13, -4))
	$Table/Col2.text = str(check_result(total,13, -13, -4))
	$Table/Col3.text = str(check_result(total,14, -13, -4))
	$Table/Col4.text = str(check_result(total,15, -13, -4))
	$Table/Col1R.text = str(check_result(total,0, 13, 4))
	$Table/Col2R.text = str(check_result(total,1, 13, 4))
	$Table/Col3R.text = str(check_result(total,2, 13, 4))
	$Table/Col4R.text = str(check_result(total,3, 13, 4))
	
	victory_check()
	
func victory_check() -> void:

	for i in get_children():
		if i is StaticBody3D and i.get_child_count() < 3:
			return

	var result: Array

	for i in $Table.get_children():
		if i is Label3D:
			result.append(int(i.text))

	if result == [2,2,3,1,3,1,2,3,1,2,2,3,3,1,2,2]:
		$"/root/Main/Hero/Camera/Ray"["collide_with_bodies"] = false
		print("Victoire !")
		door_unlock.play()
		$"../Door/Area3D".locked = false

func check_result(tableau: Array, ligne: int, portee: int = 4, move: int = 1, highest : int = 0, result: int = 0) -> int:
	for i in range(ligne, ligne+portee, move):
		if tableau[i] > highest:
			highest = tableau[i]
			result += 1
	return result
