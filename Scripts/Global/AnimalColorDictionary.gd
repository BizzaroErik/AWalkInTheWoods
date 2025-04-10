extends Node

var cat_color_array = [
	{
	"Border": Color(0.435, 0.435, 0.435, 1.0),
	"PrimaryColor": Color(0.71, 0.71, 0.71, 1.0),
	"SecondaryColor": Color(0.878, 0.878, 0.878, 1.0),
	"EyeColor": Color(0.18, 0.188, 0.18, 1.0),
	"MouthColor": Color(0.871, 0.459, 0.525, 1.0),
	},
	{
	"Border": Color(0.301, 0.301, 0.301, 1.0),
	"PrimaryColor": Color(0.451, 0.497, 0.497, 1.0),
	"SecondaryColor": Color(0.858, 0.858, 0.858, 1.0),
	"EyeColor": Color(0.18, 0.188, 0.18, 1.0),
	"MouthColor": Color(0.871, 0.459, 0.525, 1.0),
	},
	{
	"Border": Color(0.301, 0.301, 0.301, 1.0),
	"PrimaryColor": Color(0.451, 0.49, 0.463, 1.0),
	"SecondaryColor": Color(0.915, 0.871, 0.829, 0.88),
	"EyeColor": Color(0.18, 0.188, 0.18, 1.0),
	"MouthColor": Color(0.871, 0.459, 0.525, 1.0),
	}
]

func get_cat_colors(index: int) -> Dictionary:
	return cat_color_array[index]
