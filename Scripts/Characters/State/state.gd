class_name State
extends Node

@export var move_speed: float = 400
@export var jump_count: int = 1

var character: CharacterBody2D
var sprite: AnimatedSprite2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
