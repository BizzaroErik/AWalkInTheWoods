extends State

@export var follow_state: State
@export var animation_time_interval: float = 5.0

@onready var animation_change_timer: Timer = Timer.new()

var max_speed: int = 8000
var acceleration: int = 400

	
func enter() -> void:
	set_animation(0)
	animation_change_timer.wait_time = animation_time_interval
	animation_change_timer.timeout.connect(on_idle_state_timeout)
	animation_change_timer.autostart = true
	add_child(animation_change_timer)
	animation_change_timer.start()
	

func exit() -> void:
	sprite.stop()
	animation_change_timer.stop()

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	if not character.is_on_floor():
		var target_vel: float = min(character.velocity.y + acceleration * delta, max_speed * delta)
		character.velocity.y = lerp(character.velocity.y, target_vel, 1.0)
		character.move_and_slide()
	
	if character.should_follow and character.global_position.distance_to(player_position()) > 200:
		return follow_state
	else:
		return null

func player_position() -> Vector2:
	var player = get_tree().get_nodes_in_group("Player")
	return player[0].global_position
	
func set_animation(animation: int) -> void:
	match animation:
		0:
			sprite.play("idle")
		1:
			sprite.play("idle_paw_lick")
		2:
			sprite.play("idle_look")
		_:
			sprite.play("idle")

func on_idle_state_timeout() -> void:
	#set new random animation
	var range = RandomNumberGenerator.new()
	range.randomize()
	var sprite_animation = range.randi_range(0, 2)
	set_animation(sprite_animation)
