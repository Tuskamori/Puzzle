extends CharacterBody3D

const SPEED: int = 3
const sensitivity: int = 700

var item: Node

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if item:
		$Camera/Ray.collision_mask = 2
	else:
		$Camera/Ray.collision_mask = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("Q", "D", "Z", "S")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		rotation.y -= (event.relative.x / sensitivity)
		$Camera.rotation.x -= (event.relative.y / sensitivity)
		$Camera.rotation.x = clamp($Camera.rotation.x, -1.4, 1.3)

	if Input.is_action_just_pressed("ECHAP"):
		get_tree().quit()
