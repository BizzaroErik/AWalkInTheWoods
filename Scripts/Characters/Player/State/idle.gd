extends State

@export var run_state: State
@export var jump_state: State

func enter() -> void:
	sprite.play("idle")
	set_animation(character.look_dir)

func exit() -> void:
	sprite.stop()

func process_input(event: InputEvent) -> State:
	var input_dir := Input.get_vector("left", "right", "up", "down")
	if character.look_dir != input_dir && input_dir != Vector2.ZERO:
		set_animation(input_dir)
		character.look_dir = input_dir

	#print(input_dir)
	if input_dir == Vector2(1,0) or input_dir == Vector2(-1,0):
		return run_state
	elif Input.is_action_just_pressed("jump"):
		return jump_state
	else:
		return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity += character.get_gravity() * delta
	return null

func set_animation(direction) -> void:
	match direction:
		Vector2.LEFT:
			sprite.flip_h = true
		Vector2.RIGHT:
			sprite.flip_h = false
		_:
			sprite.flip_h = true
