extends State

@export var idle_state: State
@export var jump_state: State
@export var fall_state: State

var SPEED: float = 150.0

func enter() -> void:
	sprite.play("run")

func exit() -> void:
	sprite.stop()

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	var direction := Input.get_axis("left", "right")
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	
	set_animation(character.velocity.x)
	character.move_and_slide()
	
	if !character.is_on_floor():
		return fall_state
	elif character.velocity.x == 0:
		return idle_state
	if Input.is_action_just_pressed("jump"):
		#and (character.jump_count < character.max_jumps):
		#character.jump_count += 1
		return jump_state
	
	return null
	#if Input.is_action_just_pressed("dash") and character.can_dash:
		#character.change_state("dash")


func set_animation(velocity: float) -> void:
	if velocity < 0:
		character.sprite.flip_h = true
	elif velocity >= 0:
		character.sprite.flip_h = false
