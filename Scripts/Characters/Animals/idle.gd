extends State

@export var follow_state: State
@export var idle_state_time_interval: float = 5.0
@onready var idle_state_timer: Timer = Timer.new()

var idle_state_timeout: bool = false

	
func enter() -> void:
	set_animation()
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timeout)
	idle_state_timer.autostart = true
	add_child(idle_state_timer)
	idle_state_timeout = false
	idle_state_timer.start()
	

func exit() -> void:
	sprite.stop()
	idle_state_timer.stop()

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func set_animation() -> void:
	sprite.play("idle")

func on_idle_state_timeout() -> void:
	idle_state_timeout = true
