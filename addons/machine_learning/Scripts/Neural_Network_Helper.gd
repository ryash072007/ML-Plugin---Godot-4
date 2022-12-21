class_name NeuralNetworkHelper

enum {
	MUTATEALL, #0
	MUTATEWEIGHTS, #1
	MUTATEBIAS, #2
}

static func mutate(neural_network: NeuralNetwork, range: Vector2 = Vector2(-0.2, 0.2), mutation_callable: Callable = Callable(NeuralNetworkHelper, "mutate_callable"), mutation_type: int = MUTATEALL) -> NeuralNetwork:
	randomize()
	var result: NeuralNetwork = NeuralNetwork.new()
	
	for nodes in neural_network.layer_structure:
		result.add_layer(nodes)
	
	for layer_index in range(neural_network.network.size()):
		var layer: Dictionary = neural_network.network[layer_index]
		
		match mutation_type:
			MUTATEALL:
				result.network[layer_index].weights = Matrix.map_mutate(layer.weights, mutation_callable, range)
				result.network[layer_index].bias = Matrix.map_mutate(layer.bias, mutation_callable, range)
				result.network[layer_index].activation = layer.activation
			MUTATEWEIGHTS:
				result.network[layer_index].weights = Matrix.map_mutate(layer.weights, mutation_callable, range)
				result.network[layer_index].bias = layer.bias
				result.network[layer_index].activation = layer.activation
			MUTATEBIAS:
				result.network[layer_index].weights = layer.weights
				result.network[layer_index].bias = Matrix.map_mutate(layer.bias, mutation_callable, range)
				result.network[layer_index].activation = layer.activation
			_:
				pass
	
	return result

static func mutate_callable(value: float, row: int, col: int, range: Vector2) -> float:
	randomize()
	value += randf_range(range.x, range.y)
	return value

