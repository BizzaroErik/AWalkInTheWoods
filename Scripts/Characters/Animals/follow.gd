extends State

@export var idle_state: State
@export var min_speed: float = 50.0
@export var max_speed: float = 100.0

@onready var navigation_agent: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var animal: CharacterBody2D = $"../.."

var speed: float

func enter() -> void:
	set_animation()
	call_deferred("character_setup")

func exit() -> void:
	sprite.stop()

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	if navigation_agent.is_navigation_finished() and player_within_range():
		print("returning idle")
		return idle_state
	elif navigation_agent.is_navigation_finished():
		set_movement_target()
		print("nav not finished")
	
	var target_position: Vector2 = navigation_agent.get_next_path_position()
	var target_direction: Vector2 = character.global_position.direction_to(target_position)
	
	var velocity = target_direction * speed
	sprite.flip_h = velocity.x < 0
	if navigation_agent.avoidance_enabled:
		navigation_agent.velocity = velocity
	else:
		character.velocity = velocity
		character.move_and_slide()
	
	return null

func player_within_range() -> bool:
	if character.global_position.distance_to(player_position()) < 100:
		print("player is within range")
		return true
	else:
		print("player not in range")
		return false

func player_position() -> Vector2:
	var player = get_tree().get_nodes_in_group("Player")
	return player[0].global_position

func set_animation() -> void:
	sprite.play("walk")

func character_setup() -> void:
	await get_tree().physics_frame
	set_movement_target()

func set_movement_target() -> void:
	navigation_agent.target_position = player_position()
	speed = randf_range(min_speed, max_speed)
	
