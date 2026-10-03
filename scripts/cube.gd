extends StaticBody3D

@export var value: int

signal taken

func _ready() -> void:
	$Mesh.scale.y += float(value) / 5
	$Mesh.position.y += float(value) / 100
	$Value.text = str(value)

func interact() -> void:
	if not $"/root/Main/Hero".item:
		reparent($"/root/Main/Hero/SVC/Sub/Camera", false)
		position = Vector3(0.5,-0.3,-0.6)
		rotation = Vector3(0,0,0)
		$"/root/Main/Hero".item = self
		taken.emit()
