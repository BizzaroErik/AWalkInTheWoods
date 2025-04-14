extends State

@export var idle_state: State
@export var min_speed: float = 5.0
@export var max_speed: float = 10.0
@onready var animal: CharacterBody2D = $"../.."

var speed: float

func enter() -> void:
	set_animation()

func exit() -> void:
	sprite.stop()

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func set_animation() -> void:
	sprite.play("walk")
