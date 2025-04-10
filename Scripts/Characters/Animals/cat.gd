extends CharacterBody2D

#Add the animated sprite2d - done
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var cat_color_scheme: int
#Add the location to the shader - done

#Add constants script for cat colors

#export to say which index of color to use

#set colors to shader in ready
func _ready() -> void:
	set_colors()
	
func set_colors() -> void:
	print(cat_color_scheme)
	var dictColor: Dictionary = AnimalColorDictionary.get_cat_colors(cat_color_scheme)
	animated_sprite_2d.material.set_shader_parameter("replace_border", dictColor["Border"])
	animated_sprite_2d.material.set_shader_parameter("replace_primary_color", dictColor["PrimaryColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_secondary_color", dictColor["SecondaryColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_eye_color", dictColor["EyeColor"])
	animated_sprite_2d.material.set_shader_parameter("replace_mouth_color", dictColor["MouthColor"])
	
