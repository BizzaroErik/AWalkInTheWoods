extends Camera2D

@onready var player: Player = $"../Player"

var camera_follow_distance = 100  # Example distance
var camera_speed = 5  # Example speed

func _ready():
	call_deferred("set_camera")

func _physics_process(delta):
	# Calculate the distance between the camera and the player
	var distance = (player.global_position - global_position).length()
	print(distance)

	# If the player is far enough, move the camera
	if distance > camera_follow_distance:
		# Move the camera towards the player using lerp
		position = lerp(position, player.global_position, camera_speed * delta)
		print(position)

func set_camera() -> void:
	position = player.position
