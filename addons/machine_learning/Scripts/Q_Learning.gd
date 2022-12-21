class_name QLearning

var q_table: Matrix

var learning_rate: float = 1
var discount_rate: float = 0.95

var exploration_rate: float = 1
var max_exploration_rate: float = 1
var min_exploration_rate: float = 0.01

var possible_states: int
var possible_actions: int

var previous_state: int
var current_state: int = -1

var current_reward: int

var previous_action: int

func _init(_possible_states: int, _possible_actions: int) -> void:
	possible_states = _possible_states
	possible_actions = _possible_actions
	
	q_table = Matrix.new(possible_states, possible_actions)

func predict(state: int) -> int:
	current_state = state
	
	var action: int
	randomize()
	if randf_range(0, 1) > exploration_rate:
		action = q_table.data[state].find(q_table.data[state].max())
	else:
		action = randi_range(0, possible_actions - 1)
	
	previous_action = action
	previous_state = state
	return action

func reward(reward_amount: int, done: bool = false):
	q_table.data[previous_state][previous_action] = q_table.data[previous_state][previous_action] * (1 - learning_rate) + learning_rate * (reward_amount + discount_rate * q_table.data[current_state].max())

func decay_exploration_rate(amount: float = 0.01):
	if exploration_rate > min_exploration_rate:
		exploration_rate -= amount
	
