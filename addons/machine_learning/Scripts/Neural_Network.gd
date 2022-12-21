class_name NeuralNetwork

var network: Array

var ACTIVATIONS: Dictionary = {
	"SIGMOID": {
		"function": Callable(Activation, "sigmoid"),
		"derivative": Callable(Activation, "dsigmoid")
	},
	"RELU": {
		"function": Callable(Activation, "relu"),
		"derivative": Callable(Activation, "drelu")
	},
	"TANH": {
		"function": Callable(Activation, "tanh_"),
		"derivative": Callable(Activation, "dtanh")
	},
	"ARCTAN": {
		"function": Callable(Activation, "arcTan"),
		"derivative": Callable(Activation, "darcTan")
	},
	"PRELU": {
		"function": Callable(Activation, "prelu"),
		"derivative": Callable(Activation, "dprelu")
	},
	"ELU": {
		"function": Callable(Activation, "elu"),
		"derivative": Callable(Activation, "delu")
	},
	"SOFTPLUS": {
		"function": Callable(Activation, "softplus"),
		"derivative": Callable(Activation, "dsoftplus")
	}
}

var raycasts: Array = []

var learning_rate: float = 0.1

var layer_structure: Array[int] = []

var fitness: float = 0.0

func add_layer(nodes: int, activation: Dictionary = ACTIVATIONS.SIGMOID) -> int: #Returns the number of layers in the network
	if layer_structure.size() != 0:
		
		var layer_data: Dictionary
		
		if activation == ACTIVATIONS.RELU:
			layer_data = {
				"weights": Matrix.rand(Matrix.new(nodes, layer_structure[-1]), true),
				"bias": Matrix.rand(Matrix.new(nodes, 1), true),
				"activation": activation
			}
		else:
			layer_data = {
				"weights": Matrix.rand(Matrix.new(nodes, layer_structure[-1])),
				"bias": Matrix.rand(Matrix.new(nodes, 1)),
				"activation": activation
			}

		network.push_back(layer_data)

	layer_structure.append(nodes)
	
	return layer_structure.size()

func predict(input_array: Array) -> Array:
	var inputs: Matrix = Matrix.from_array(input_array)
	
	for layer in network:
		var product: Matrix = Matrix.dot_product(layer.weights, inputs)
		var sum: Matrix = Matrix.add(product, layer.bias)
		var map: Matrix = Matrix.map(sum, layer.activation.function)
		inputs = map
	
	return Matrix.to_array(inputs)

func train(input_array: Array, target_array: Array):
	var inputs: Matrix = Matrix.from_array(input_array)
	var targets: Matrix = Matrix.from_array(target_array)

	var layer_inputs: Matrix = inputs
	var outputs: Array[Matrix]
	
	for layer in network:
		var product: Matrix = Matrix.dot_product(layer.weights, layer_inputs)
		var sum: Matrix = Matrix.add(product, layer.bias)
		var map: Matrix = Matrix.map(sum, layer.activation.function)
		layer_inputs = map
		outputs.append(map)
	
	var expected_output: Matrix = targets
	
	var next_layer_errors: Matrix
	
	for layer_index in range(network.size() - 1, -1, -1):
		var layer: Dictionary = network[layer_index]
		var layer_outputs: Matrix = outputs[layer_index]
		
		if layer_index == network.size() - 1:
			var output_errors: Matrix = Matrix.subtract(expected_output, layer_outputs)
			next_layer_errors = output_errors
			
			var gradients: Matrix = Matrix.map(layer_outputs, layer.activation.derivative)
			gradients = Matrix.multiply(gradients, output_errors)
			gradients = Matrix.scalar(gradients, learning_rate)
			
			var weight_delta: Matrix
			if layer_index == 0:
				weight_delta = Matrix.dot_product(gradients, Matrix.transpose(inputs))
			else:
				weight_delta = Matrix.dot_product(gradients, Matrix.transpose(outputs[layer_index - 1]))
			
			network[layer_index].weights = Matrix.add(layer.weights, weight_delta)
			network[layer_index].bias = Matrix.add(layer.bias, gradients)
		else:
			var weights_hidden_output_t = Matrix.transpose(network[layer_index + 1].weights)
			
			var hidden_errors = Matrix.dot_product(weights_hidden_output_t, next_layer_errors)
			next_layer_errors = hidden_errors
			
			var hidden_gradient = Matrix.map(layer_outputs, layer.activation.derivative)
			hidden_gradient = Matrix.multiply(hidden_gradient, hidden_errors)
			hidden_gradient = Matrix.scalar(hidden_gradient, learning_rate)
			
			var inputs_t: Matrix
			if layer_index != 0:
				inputs_t = Matrix.transpose(outputs[layer_index - 1])
			else:
				inputs_t = Matrix.transpose(inputs)
			var weight_delta = Matrix.dot_product(hidden_gradient, inputs_t)
			
			network[layer_index].weights = Matrix.add(layer.weights, weight_delta)
			network[layer_index].bias = Matrix.add(layer.bias, hidden_gradient)

func predict_from_raycasts(addition_args: Array = []) -> Array:
	var input_array: Array = []
	for ray in raycasts:
		if ray.is_colliding():
			var origin = ray.global_position
			var collision_point = ray.get_collision_point()
			input_array.append(origin.distance_to(collision_point))
		else:
			input_array.append(0.0)
	
	input_array.append_array(addition_args)
	
	var input: Array = input_array
	
	return predict(input)

func add_raycast(ray) -> void:
	raycasts.append(ray)

func copy(fitness: bool = false) -> NeuralNetwork:
	var copy_version: NeuralNetwork = NeuralNetwork.new()
	copy_version.network = network
	copy_version.learning_rate = learning_rate
	copy_version.layer_structure = layer_structure
	if fitness: copy_version.fitness = fitness
	return copy_version
