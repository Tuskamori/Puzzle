extends StaticBody3D

var total: Array = []

func _ready() -> void:
	for i in range(get_child_count() -1):
		total.append(get_child(i).value)

func update() -> void:
	for i in range(len(total)):
		total[i] = get_child(i).value

	# TODO Mettre en place un système pour check les 16 résultats
	# Exemple de puzzle :
	#   1 2 2 3
	# 1         3
	# 3         2
	# 2         1
	# 2         3
	#   3 1 2 2

	var line1: Array
	var highest: int = 0
	var result: int = 0

	for i in range(4):
		line1.append(total[i])
	for i in range(len(line1)):
		if line1[i] > highest:
			highest = line1[i]
			result += 1
	if result == 4:
		print("Victoire !")
