extends StaticBody3D

var total: Array = []

# TODO Mettre une condition de victoire et un écran de fin
# Exemple de puzzle :
#   1 2 2 3
# 1         3
# 3         2
# 2         1
# 2         3
#   3 1 2 2

func _ready() -> void:
	for i in get_children():
		if i is StaticBody3D:
			total.append(i.value)

func update() -> void:
	for i in range(len(total)):
		total[i] = get_child(i).value
	for i in $Table.get_children():
		if i is Label3D:
			$Table/Line1.text = str(check_result(total,0))
			$Table/Line2.text = str(check_result(total,4))
			$Table/Line3.text = str(check_result(total,8))
			$Table/Line4.text = str(check_result(total,12))
			$Table/Line1R.text = str(check_result(total,3, -4, -1))
			$Table/Line2R.text = str(check_result(total,7, -4, -1))
			$Table/Line3R.text = str(check_result(total,11, -4, -1))
			$Table/Line4R.text = str(check_result(total,15, -4, -1))
			$Table/Col1.text = str(check_result(total,12, -12, -4))
			$Table/Col2.text = str(check_result(total,13, -12, -4))
			$Table/Col3.text = str(check_result(total,14, -12, -4))
			$Table/Col4.text = str(check_result(total,15, -12, -4))
			$Table/Col1R.text = str(check_result(total,0, 12, 4))
			$Table/Col2R.text = str(check_result(total,1, 12, 4))
			$Table/Col3R.text = str(check_result(total,2, 12, 4))
			$Table/Col4R.text = str(check_result(total,3, 12, 4))

func check_result(line: Array, row: int, sens: int = 4, move: int = 1, highest : int = 0, result: int = 0) -> int:
	for i in range(row,row+sens,move):
		if line[i] > highest:
			highest = line[i]
			result += 1
	return result
