class_name Player
extends CharacterBody2D

@onready var state: Node = $State
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var look_dir: Vector2 = Vector2.ZERO

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	state.init(self, sprite)

func _unhandled_input(event):
	state.process_input(event)

func _physics_process(delta: float) -> void:
	state.process_physics(delta)

func _process(delta: float) -> void:
	state.process_frame(delta)

func on_tool_selected(tool: DataTypes.Tools) -> void:
	pass
