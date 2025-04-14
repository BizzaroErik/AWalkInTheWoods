extends State

@export var idle_state: State
@export var run_state: State
@export var fall_state: State

var horizontal_adjust: int = 350
var max_speed: int = 8000
var acceleration: int = 400
var jump_height: int = 300
var direction: int = 0
var friction: float = 0.22
var weight: float = 0.3

func enter() -> void:
	character.velocity.y = -jump_height
	sprite.play("jump")

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	set_animation(event)
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	if not character.is_on_floor():
		var target_vel: float = min(character.velocity.y + acceleration * delta, max_speed * delta)
		character.velocity.y = lerp(character.velocity.y, target_vel, 1.0)

	var direction := Input.get_axis("left", "right")
	if direction:
		character.velocity.x = direction * horizontal_adjust
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, horizontal_adjust)
	character.move_and_slide()
	
	if character.velocity.y > 0:
		return fall_state
	elif character.is_on_floor():
		return idle_state
	else:
		return null

func set_animation(event) -> void:
	if event.is_action_pressed("left"):
		character.sprite.flip_h = true
	elif event.is_action_pressed("right"):
		character.sprite.flip_h = false
