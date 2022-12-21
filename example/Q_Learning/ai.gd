extends Area2D

var qlearning: QLearning = QLearning.new(16, 4)
var state: int = 0
var prev_state: int
var prev_prev_state: int

var actions: Dictionary = {
	0: Vector2(0, -72),
	1: Vector2(72, 0),
	2: Vector2(0, 72),
	3: Vector2(-72, 0)
}

func _ready() -> void:
	randomize()
	$"../../move_timer".connect("timeout", _on_move_timer_timeout)
	qlearning.current_state = state
	position = $"../State".position

func _on_move_timer_timeout() -> void:
	var action: int = qlearning.predict(state)
	if state == prev_prev_state: 
		qlearning.reward(-10)
		print("YES")
	else: qlearning.reward(-5)
	prev_prev_state = prev_state
	prev_state = state
	var tween := create_tween()
	tween.tween_property(self, "position", position + actions[action], 0.1)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("state"): state_entered(area)
	if area.is_in_group("boundary"): die_boundary()

func state_entered(area: Area2D):
	state = area.state
	if area.reward_state:
		qlearning.reward(1000)
		die()
	elif area.death_state:
		qlearning.reward(-100)
		die()

func die_boundary():
	qlearning.reward(-10)
	die()

func die():
	position = $"../State".position
	qlearning.decay_exploration_rate(0.001)
