extends Node

@export var starting_state: State
@export var current_state: State

func init(parent: CharacterBody2D, sprite: AnimatedSprite2D) -> void:
	for child in get_children():
		child.character = parent
		child.sprite = sprite
	change_state(starting_state)

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		#print("input changed state changed to " + new_state.name)
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		#print("physics changed state changed to " + new_state.name)
		change_state(new_state)
