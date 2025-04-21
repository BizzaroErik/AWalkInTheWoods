extends SubViewportContainer

@onready var player_position_timer: Timer = Timer.new()
@export var player_position_timer_interval: float = 0.01

func _ready() -> void:
	player_position_timer.wait_time = player_position_timer_interval
	player_position_timer.timeout.connect(on_idle_state_timeout)
	player_position_timer.autostart = true
	add_child(player_position_timer)
	player_position_timer.start()

func on_idle_state_timeout() -> void:
	#transform range 200 to 900 pixels is eqivalent to 0 to 1
	var distance_to_player = distance_to_player_position()
	var dissolve = remap(distance_to_player,600.0, 1500.0, 0.0, 1.0)
	material.set_shader_parameter('Dissolve', dissolve)
	
	

func distance_to_player_position() -> float:
	var player = get_tree().get_nodes_in_group("Player")
	var self_adjusted = self.global_position + Vector2(500, 0)
	return self_adjusted.distance_to(player[0].global_position)
