extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state: Node = $State

@export var cat_color_scheme: int

func _ready() -> void:
	set_colors()
	state.init(self, animated_sprite_2d)
	
func set_colors() -> void:
	var dictColor: Dictionary = AnimalColorDictionary.get_cat_colors(cat_color_scheme)
	animated_sprite_2d.material.set_shader_parameter("replace_border", dictColor["Border"])
	animated_sprite_2d.material.set_shader_parameter("replace_primary_color", dictColor["PrimaryColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_secondary_color", dictColor["SecondaryColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_eye_color", dictColor["EyeColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_mouth_color", dictColor["MouthColor"])
	
func _unhandled_input(event):
	state.process_input(event)

func _physics_process(delta: float) -> void:
	state.process_physics(delta)

func _process(delta: float) -> void:
	state.process_frame(delta)
