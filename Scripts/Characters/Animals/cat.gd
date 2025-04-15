extends CharacterBody2D

@export var cat_color_scheme: int

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state: Node = $State

func _ready() -> void:
	set_colors()
	state.init(self, sprite)
	
func set_colors() -> void:
	var dictColor: Dictionary = AnimalColorDictionary.get_cat_colors(cat_color_scheme)
	sprite.material.set_shader_parameter("replace_border", dictColor["Border"])
	sprite.material.set_shader_parameter("replace_primary_color", dictColor["PrimaryColor"])
	sprite.material.set_shader_parameter("replace_secondary_color", dictColor["SecondaryColor"])
	sprite.material.set_shader_parameter("replace_eye_color", dictColor["EyeColor"])
	sprite.material.set_shader_parameter("replace_mouth_color", dictColor["MouthColor"])
	
func _unhandled_input(event):
	state.process_input(event)

func _physics_process(delta: float) -> void:
	state.process_physics(delta)

func _process(delta: float) -> void:
	state.process_frame(delta)
