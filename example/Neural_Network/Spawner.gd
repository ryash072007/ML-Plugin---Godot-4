extends Node2D

var ai := preload("res://example/Neural_Network/Player.tscn")

var best_ai: NeuralNetwork = NeuralNetwork.new()
var best_ai_fitness: float = 0.0

var generation: int = 0
var range: Vector2 = Vector2(-0.5, 0.5)

func _ready() -> void:
	generation += 1
	for i in range(30):
		var new_ai := ai.instantiate()
		new_ai.set_up_nn = true
		add_child(new_ai)

func _on_reload_timeout() -> void:
	print("Best Fitness: ", best_ai_fitness)
	generation += 1
	
	var best_number: int = 1
	var mutated_number: int = 24
	var random_number: int = 5
	
	if generation > 19:
		mutated_number += random_number
		random_number = 0
	
#	if generation > 39:
#		mutated_number = 0
	
	print("************* ", "Generation: ", generation, " *************")
	print("Mutation Range: ", range)
	for child in get_children():
		child.queue_free()
	
	for i in range(best_number):
		var new_ai := ai.instantiate()
		new_ai.nn = best_ai.copy()
		new_ai.modulate = Color.RED
		new_ai.z_index = 100
		add_child(new_ai)
	print("Best Spawned: ", best_number)
	
	for i in range(mutated_number):
		range = lerp(range, Vector2(0, 0), 0.001)
		var new_ai := ai.instantiate()
		new_ai.nn = NeuralNetworkHelper.mutate(best_ai, range).copy()
		new_ai.modulate = Color.MAGENTA
		new_ai.z_index = 50
		add_child(new_ai)
	print("Mutated Spawned: ", mutated_number)
	
	for i in range(random_number):
		var new_ai := ai.instantiate()
		new_ai.set_up_nn = true
		add_child(new_ai)
	print("New Spawned: ", random_number)

func upload(nn: NeuralNetwork):
	if nn.fitness > best_ai_fitness:
		best_ai_fitness = nn.fitness
		best_ai = nn.copy(true)

func _process(_delta: float) -> void:
	$"../gen".text = "Gen: " + str(generation)
