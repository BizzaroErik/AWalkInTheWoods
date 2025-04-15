extends State

@export var follow_state: State
@export var idle_state_time_interval: float = 5.0
@onready var idle_state_timer: Timer = Timer.new()
var max_speed: int = 8000
var acceleration: int = 400
var idle_state_timeout: bool = false
var should_follow: bool = false

	
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
	if not character.is_on_floor():
		var target_vel: float = min(character.velocity.y + acceleration * delta, max_speed * delta)
		character.velocity.y = lerp(character.velocity.y, target_vel, 1.0)
		print(character.velocity.y)
		character.move_and_slide()
	return null

func set_animation() -> void:
	sprite.play("idle")

func on_idle_state_timeout() -> void:
	idle_state_timeout = true
