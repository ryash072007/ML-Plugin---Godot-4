GDPC                  @                                                                      #   T   res://.godot/exported/133200997/export-0b195a79d911266da4181d63664e61c5-state.scn   ??      %      F?p?0pȎ?{--???    `   res://.godot/exported/133200997/export-27a9bfcc36efa0e31de48eb447c543a3-NeuralNetworkExample.scn?C      ?      ???E?j?N)?4_??}    T   res://.godot/exported/133200997/export-83d028f6321562d825708289b0a80a6e-Death.scn   ?8      ?      '? -???ͥ??j?Tb    T   res://.godot/exported/133200997/export-d05a17cb80496a5ca6811b7b4d79bbec-Player.scn  pd            j˵?j.?-]??T??M    P   res://.godot/exported/133200997/export-f9947760efac52833f46d5d8e3fb0b8d-End.scn ?>      ?      r?dJa$??ܚ^)????    `   res://.godot/exported/133200997/export-fe3d9fdda054341cc8832459b34044f2-q_learning_example.scn   {      ?-      Z*??	???͔?F?    `   res://.godot/exported/133200997/export-feba13d392503aaf88b650821b988075-virtual_q_learning.scn  Ш      ?      R??i?a???x,??qE    H   res://.godot/imported/Tileset.png-2b19c3154665835bf072a702108974f8.ctex  r      h       ?b{???S?U???*;??    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexа      ^      2??r3??MgB?[79       res://.godot/uid_cache.bin  ??      ?      ?u?????Y?a]?????    4   res://addons/machine_learning/Scripts/Activation.gd         ;      ??G?s??s?}d?l?    0   res://addons/machine_learning/Scripts/Matrix.gd @      >      ??d?? SGL(h9??!    8   res://addons/machine_learning/Scripts/Neural_Network.gd ?      ?      ?g߯?s?|k/??Z    @   res://addons/machine_learning/Scripts/Neural_Network_Helper.gd  0,      ?      Vm]?#?L? b0?:    4   res://addons/machine_learning/Scripts/Q_Learning.gd  2      b      X?|???s^?	???    (   res://addons/machine_learning/plugin.gd ?7      ?       ????\?>???g^i??J    (   res://example/Neural_Network/Death.gd   @8      n       ??R??? T?<?[츫    0   res://example/Neural_Network/Death.tscn.remap   ??      b       ???v8??"?":/X{    $   res://example/Neural_Network/End.gd P>      n       ??R??? T?<?[츫    ,   res://example/Neural_Network/End.tscn.remap ??      `       ?s?N_?N	??w1;?_    4   res://example/Neural_Network/NeuralNetworkExample.gd?C             (f?և???ζ?߾??    <   res://example/Neural_Network/NeuralNetworkExample.tscn.remapP?      q       Ɇ??*gn?ծ_??    (   res://example/Neural_Network/Player.gd  ?`      ?      P?~m\6?{?e?Ħ    0   res://example/Neural_Network/Player.tscn.remap  ??      c       NpXPj?	F?'<p    (   res://example/Neural_Network/Spawner.gd ?k      ?      y?_???5?????8?    0   res://example/Neural_Network/Tileset.png.import ?r            ?O?!??~k??$#=?{        res://example/Q_Learning/ai.gd  ?u      q      #`P?????$H??    8   res://example/Q_Learning/q_learning_example.tscn.remap  @?      o       cyé1???	?z?e??    $   res://example/Q_Learning/state.gd   p?      #      ??Mx?ȂlA??????}    ,   res://example/Q_Learning/state.tscn.remap    ?      b       ?i??d?3#???N???    0   res://example/Q_Learning/virtual_q_learning.gd  ??             (f?և???ζ?߾??    8   res://example/Q_Learning/virtual_q_learning.tscn.remap  ??      o       s*aX?R???w?b=?       res://icon.svg  ??      N      ]??s?9^w/??????       res://icon.svg.import   0?      C      ??Ѵ?ޞ??????aW?       res://project.binary??      ]      ???*?>u$??EZ?    ?G1class_name Activation

static func sigmoid(value: float, _row: int, _col: int) -> float:
	return 1 / (1 + exp(-value))

static func dsigmoid(value: float, _row: int, _col: int) -> float:
	return value * (1 - value)

static func relu(value: float, _row: int, _col: int) -> float:
	return max(0.0, value)

static func drelu(value: float, _row: int, _col: int) -> float:
	if value < 0:
		return 0.0
	else:
		return 1.0

static func tanh_(value: float, _row: int, _col: int) -> float:
	return tanh(value)

static func dtanh(value: float, _row: int, _col: int) -> float:
	return 1 - pow(tanh(value), 2)

static func arcTan(value: float, _row: int, _col: int) -> float:
	return pow(tan(value), -1)

static func darcTan(value: float, _row: int, _col: int) -> float:
	return 1 / (pow(value, 2) + 1)

static func prelu(value: float, _row: int, _col: int) -> float:
	var alpha: float = 0.1
	return (alpha * value) if value < 0 else value

static func dprelu(value: float, _row: int, _col: int) -> float:
	var alpha: float = 0.1
	return alpha if value < 0 else 1

static func elu(value: float, _row: int, _col: int) -> float:
	var alpha: float = 0.1
	if value < 0:
		return alpha * (exp(value) - 1)
	else:
		return value

static func delu(value: float, _row: int, _col: int) -> float:
	var alpha: float = 0.1
	return (((alpha * (exp(value) - 1)) if value < 0 else value) + alpha) if value < 0 else 1

static func softplus(value: float, _row: int, _col: int) -> float:
	return log(exp(1)) * (1 + exp(value))

static func dsoftplus(value: float, _row: int, _col: int) -> float:
	return 1 / (1 + exp(-value))
?*u& class_name Matrix

var rows: int
var cols: int

var data = []

func _init(_rows: int, _cols: int, value: float = 0.0) -> void:
	randomize()
	rows = _rows
	cols = _cols
	for row in range(rows):
		data.insert(row , [])
		for col in range(cols):
			data[row].insert(col, value)

static func from_array(arr: Array) -> Matrix:
	var result = Matrix.new(arr.size(), 1)
	for row in range(result.rows):
		result.data[row][0] = arr[row]
	return result

static func to_array(matrix: Matrix) -> Array:
	var result = []
	for row in range(matrix.rows):
		for col in range(matrix.cols):
			result.append(matrix.data[row][col])
	return result

static func rand(matrix: Matrix, is_relu: bool = false) -> Matrix:
	seed(randi())
	randomize()
	
	var result = Matrix.new(matrix.rows, matrix.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			if !is_relu:
				result.data[row][col] = randf_range(-1, 1)
			else:
				result.data[row][col] = randf_range(0, 1)
	return result

static func add(a: Matrix, b: Matrix) -> Matrix:
	assert(a.rows == b.rows and a.cols == b.cols)
	
	var result = Matrix.new(a.rows, a.cols)

	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = a.data[row][col] + b.data[row][col]

	return result

static func subtract(a: Matrix, b: Matrix) -> Matrix:
	assert(a.rows == b.rows and a.cols == b.cols)

	var result = Matrix.new(a.rows, a.cols)

	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = a.data[row][col] - b.data[row][col]

	return result

static func scalar(matrix: Matrix, value: float) -> Matrix:
	var result = Matrix.new(matrix.rows, matrix.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = matrix.data[row][col] * value
	
	return result

static func dot_product(a: Matrix, b: Matrix) -> Matrix:
	assert(a.cols == b.rows)

	var result = Matrix.new(a.rows, b.cols)

	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = 0.0
			for k in range(a.cols):
				result.data[row][col] += a.data[row][k] * b.data[k][col]

	return result

static func dot_divide(a: Matrix, b: Matrix) -> Matrix:
	assert(a.cols == b.rows)

	var result = Matrix.new(a.rows, b.cols)

	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = 0.0
			for k in range(a.cols):
				result.data[row][col] += b.data[k][col] / a.data[row][k]

	return result




static func multiply(a: Matrix, b: Matrix) -> Matrix:
	assert(a.rows == b.rows and a.cols == b.cols)
	
	var result = Matrix.new(a.rows, a.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = a.data[row][col] * b.data[row][col]
	
	return result


static func divide(a: Matrix, b: Matrix) -> Matrix:
	assert(a.rows == b.rows and a.cols == b.cols)
	
	var result = Matrix.new(a.rows, a.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = a.data[row][col] / b.data[row][col]
	
	return result

static func transpose(matrix: Matrix) -> Matrix:
	var result = Matrix.new(matrix.cols, matrix.rows)

	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = matrix.data[col][row]

	return result

static func map(matrix: Matrix, callback: Callable) -> Matrix:
	var result = Matrix.new(matrix.rows, matrix.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = callback.call(matrix.data[row][col], row, col)

	return result

static func map_mutate(matrix: Matrix, callback: Callable, range: Vector2 = Vector2(-0.2, 0.2)) -> Matrix:
	var result = Matrix.new(matrix.rows, matrix.cols)
	
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = callback.call(matrix.data[row][col], row, col, range)

	return result

static func random(a: Matrix, b: Matrix) -> Matrix:
	var result = Matrix.new(a.rows, a.cols)
	for row in range(result.rows):
		for col in range(result.cols):
			randomize()
			var _random = randf_range(0, 1)
			result.data[row][col] = a.data[row][col] if _random > 0.5 else b.data[row][col]
	
	return result

static func copy(matrix: Matrix) -> Matrix:
	var result = Matrix.new(matrix.rows, matrix.cols)
	for row in range(result.rows):
		for col in range(result.cols):
			result.data[row][col] = matrix.data[row][col]
	return result

static func average(matrix: Matrix) -> float:
	var average_value: float = 0.0
	for row in range(matrix.rows):
		for col in range(matrix.cols):
			average_value += matrix.data[row][col]
	average_value = average_value / matrix.rows * matrix.cols
	return average_value
?class_name NeuralNetwork

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
?????haAclass_name NeuralNetworkHelper

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

???)?class_name QLearning

var q_table: Matrix

var learning_rate: float = 0.5
var discount_rate: float = 0.99

var exploration_rate: float = 1
var max_exploration_rate: float = 1
var min_exploration_rate: float = 0.001

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
#	print(state)
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

func decay_exploration_rate(amount: float = 0.1):
	if exploration_rate > min_exploration_rate:
		exploration_rate -= amount
	
#	print("************************")
#	for row in q_table.rows:
#		print(q_table.data[row])
??|f??`?_?}?2@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
?B??i+????????extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.queue_free()
7{RSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script &   res://example/Neural_Network/Death.gd ????????      local://RectangleShape2D_h1f7h ?         local://RectangleShape2D_w240l ?         local://PackedScene_hoxur ?         RectangleShape2D       
      B   B         RectangleShape2D       
     ?A  ?A         PackedScene          	         names "         Death    collision_layer    collision_mask    script    Area2D    color    offset_left    offset_top    offset_right    offset_bottom    metadata/_edit_use_anchors_ 
   ColorRect 
   collision    shape    CollisionShape2D    StaticBody2D    collision2    _on_body_entered    body_entered    	   variants    	                        ??     ?A   ??~?  ?????=  ??                                     node_count             nodes     ;   ????????       ????                                         ????                     	            
                        ????                           ????                          ????                   conn_count             conns                                   node_paths              editable_instances              version             RSRCextends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.queue_free()
??RSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script $   res://example/Neural_Network/End.gd ????????      local://RectangleShape2D_i84m0 f         local://PackedScene_tfq44 ?         RectangleShape2D       
      B   B         PackedScene          	         names "         End    collision_layer    collision_mask    script    Area2D    color    offset_left    offset_top    offset_right    offset_bottom    metadata/_edit_use_anchors_ 
   ColorRect 
   collision    shape    CollisionShape2D    _on_body_entered    body_entered    	   variants                            ??     ?A   ???=  ??      ??                      node_count             nodes     )   ????????       ????                                         ????                     	            
                        ????                   conn_count             conns                                   node_paths              editable_instances              version             RSRCV?? ??=dextends Node2D
?RSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity '   0:0/0/physics_layer_0/polygon_0/points    0:0/0/script    1:0/0 &   1:0/0/physics_layer_0/linear_velocity '   1:0/0/physics_layer_0/angular_velocity    1:0/0/script    script    scenes/1/scene    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/0 
   sources/1 
   sources/2    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled       Script 5   res://example/Neural_Network/NeuralNetworkExample.gd ????????
   Texture2D )   res://example/Neural_Network/Tileset.png D?I?X~%^   PackedScene &   res://example/Neural_Network/End.tscn n??/?3Z   PackedScene (   res://example/Neural_Network/Death.tscn ?o?R??F   Script (   res://example/Neural_Network/Spawner.gd ????????   !   local://TileSetAtlasSource_m8rls g      ,   local://TileSetScenesCollectionSource_hh8ar 6      ,   local://TileSetScenesCollectionSource_eeqty ?         local://TileSet_asg3x ?         local://PackedScene_y6kwn 8         TileSetAtlasSource                   -                        
           	          
   %        ??  ??  ?A  ??  ?A  ?A  ??  ?A                   
                                    TileSetScenesCollectionSource             End                      TileSetScenesCollectionSource             Death                      TileSet       -                                                                  PackedScene          	         names "         NeuralNetworkExample    script    Node2D    TileMap 	   tile_set    format    layer_0/tile_data    reload 
   wait_time 
   autostart    Timer    Spawner 	   position 	   Camera2D    current    zoom    gen    offset_left    offset_right    offset_bottom $   theme_override_font_sizes/font_size    text    Label    _on_reload_timeout    timeout    	   variants                                    \                                                                                                                                                                                        	          	          
          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    !          !          "          "          #          #                                                                                                     	          
                                                                                                                                                                                                                                       !          "          #          ????        ??          ??         ??         ??         ??         ??         ??         ??         ??         ??	         ??
         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??           ??         ??         ??         ??         ??         ??         ??         ??         ??        	 ??        
 ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??          ??        ! ??        " ??        # ??        $ ??        $        $        $        $        $        $          $          $          $         $        $        $        $        $        $        $        $        $ 	       $ 
       $        $                                      	                                                                                                                                                                           	                   % ??        %           %          %          %          %          %          %          %          %          % 	         % 
         %          %          %          %          %          %          %          %          %          %                   	               ??         ??         ??	         ??
         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ????        ????        ??          ??         ??         ??         ??         ??         ??         ????          ??         ??         ??         ??         ??         ??         ??         ??         ??        	 ??        
 ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??         ??          ??        ! ??        " ??        # ??        $ ??        % ??        & ??        & ??        &           &          &          &          &          &          &          &          &          & 	         & 
         &          &          &          &          &          &          &          &          &          &          ??         ??                                                                                                    	          
                                                                                                                                                                                                                                       !          "          #          $          %          &                                  
                   
                                                
            ?@      
     ?A ?
D         
    ?D ??C
   fff?fff?     ?A    ?UD     C   K         Gen:        node_count             nodes     J   ????????       ????                            ????                                 
      ????         	                        ????                                 ????                  	                     ????      
                                     conn_count             conns                                 node_paths              editable_instances              version             RSRCUextends CharacterBody2D

var nn: NeuralNetwork = NeuralNetwork.new()
var jump_height: float = 550.0
var speed: float = 300.0
var gravity: float = 30.0
var set_up_nn: bool = false
var time_alive: float = 0.0

func _ready() -> void:
	if set_up_nn:
		nn.add_layer($Raycasts.get_child_count()) #Input Layer
		nn.add_layer(8, nn.ACTIVATIONS.ARCTAN) #Hidden Layer
		nn.add_layer(4, nn.ACTIVATIONS.ARCTAN) #Hidden Layer
		nn.add_layer(1, nn.ACTIVATIONS.SIGMOID) #Output Layer
	
	for ray in $Raycasts.get_children():
		nn.add_raycast(ray)

func _physics_process(delta: float) -> void:
	time_alive += delta
	var prediction: Array = nn.predict_from_raycasts()
	if prediction[0] < 0.5 and is_on_floor():
		velocity.y -= jump_height
	
	velocity.x = speed
	velocity.y += gravity
	
#	velocity = velocity# * delta
#	move_and_collide(velocity * delta)
	move_and_slide()

func _on_tree_exiting() -> void:
	nn.fitness = pow(global_position.x, 3) / time_alive
	get_parent().upload(nn)
??a????v9wRSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script '   res://example/Neural_Network/Player.gd ????????      local://RectangleShape2D_1wrnh i         local://PackedScene_43k13 ?         RectangleShape2D       
      B   B         PackedScene          	         names "         Player    collision_mask    script    CharacterBody2D 
   collision    shape    CollisionShape2D    color    offset_left    offset_top    offset_right    offset_bottom    metadata/_edit_use_anchors_    ai 
   ColorRect 	   Raycasts    Node2D 
   RayCast2D    target_position    RayCast2D6 	   rotation    RayCast2D7    RayCast2D2    RayCast2D3    RayCast2D4    RayCast2D5    _on_tree_exiting    tree_exiting    	   variants                                      ??     ?A      
     ?C       ???>   ?I?   ??ľ   ?D?   r??   ?ɿ      node_count             nodes     ?   ????????       ????                                  ????                           ????         	      
                                      ????                     ????                                 ????                                       ????                                       ????      	                                 ????      
                                 ????                                       ????                                conn_count             conns                                   node_paths              editable_instances              version             RSRC?J!?9ȓ/?eK?Jextends Node2D

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
.R?>?S?GST2   @          ????               @          0   RIFF(   WEBPVP8L   /?? 0?C<?x&???7??U? O??/@???[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c3wg7lf3asy5y"
path="res://.godot/imported/Tileset.png-2b19c3154665835bf072a702108974f8.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://example/Neural_Network/Tileset.png"
dest_files=["res://.godot/imported/Tileset.png-2b19c3154665835bf072a702108974f8.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
???}????k?nextends Area2D

var qlearning: QLearning = QLearning.new(16, 4)
var state: int = 0

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
	var tween := create_tween()
	tween.tween_property(self, "position", position + actions[action], 0.15)
#	position += actions[action]

#func _process(delta: float) -> void:
#	var action: int = qlearning.predict(state)
#	position += actions[action]

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("state"): state_entered(area)
	if area.is_in_group("boundary"): die_boundary()

func state_entered(area: Area2D):
	state = area.state
#	area.modulate = Color.RED
	if area.reward_state:
		qlearning.reward(10000)
		die()
	elif area.death_state:
		qlearning.reward(-100)
		die()
	else:
		qlearning.reward(-2)

func die_boundary():
	qlearning.reward(-10)
	die()

func die():
	position = $"../State".position
	qlearning.decay_exploration_rate(0.001)
#	print("**********************")
#	print("exploration rate: ", qlearning.exploration_rate)
#	print("q table: ")
#	for row in qlearning.q_table.rows:
#		print(qlearning.q_table.data[row])
[]??Uk4??y?ҒRSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       PackedScene $   res://example/Q_Learning/state.tscn 5|,???i   Script    res://example/Q_Learning/ai.gd ????????      local://RectangleShape2D_xi7pv ?         local://RectangleShape2D_uxw6a ?         local://PackedScene_h50kp .         RectangleShape2D       
     ?C  8B         RectangleShape2D       
      B   B         PackedScene          	         names "   ;      QLearningExample    Node2D    env 	   position    State    State2    state    State3    punishment_state    death_state    State4    reward_state    State5    State6    State7    State8    State9    State10    State11    State12    State13    State14    State15    State16 	   boundary 	   priority    Area2D    CollisionShape2D    shape    CollisionShape2D3 	   rotation    CollisionShape2D4    CollisionShape2D2 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    metadata/_edit_use_anchors_    ColorRect3    ColorRect4    ColorRect2    ai    script    env2    env3    env4    env5    env6    move_timer 
   wait_time 
   autostart    Timer 	   Camera2D    current    zoom    _on_area_entered    area_entered    	   variants    C   
     sC  XC          
     ??  ??
     ?  ??      
     B  ??                   
     ?B  ??      
     ??  ?      
     ?  ?      
     B  ?      
     ?B  ?      
     ??  B      
     ?  B   	   
     B  B   
   
     ?B  B      
     ??  ?B      
     ?  ?B      
     B  ?B      
     ?B  ?B      
     ?  ??     ??
    @D  C          
    ??C  ?C   ???
    ?:D  ?C
     D ??C    ??C     C    ??D     7C   ???>???>?? <  ??     ?C    ?KD   ???     ?D     ?C    @ D                       ??     ?A                 ??
    @)D  TC
     ?D  PC
     wC @!D
    @*D @ D
    ??D @D)   ????????
    @+D  ?C
     @?  @?      node_count    ?         nodes     ?  ????????       ????                      ????                     ???                          ???                                ???                           	                 ???
            	      
                          ???                                ???                                ???                                ???                                ???                                ???                           	                 ???                                ???                                ???                                ???                                ???                                             ???            !      "                    ????      #      $                      ????      %      &                    ????      '      (      &                    ????      )      (      &                     ????      *      &              !   !   ????   "   +   #   ,   $   -   %   .   &   /   '                 !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '                 !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '                 !   *   ????   "   +   #   4   $   -   %   5   &   /   '                    +   ????         ,   6                    ????      7              !   !   ????   "   8   #   8   $   9   %   9   &   :   '                     -   ????      ;              ???                          ???                                ???                           	                 ???
            	      
                          ???                                ???                                ???                                ???                                ???                                ???                           	                 ???                                ???                                ???                                ???                                ???                                             ???            !      "                    ????      #      $         /             ????      %      &       /             ????      '      (      &       /             ????      )      (      &       /              ????      *      &       /       !   !   ????   "   +   #   ,   $   -   %   .   &   /   '          /       !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '          /       !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '          /       !   *   ????   "   +   #   4   $   -   %   5   &   /   '                    +   ????         ,   6       8             ????      7       8       !   !   ????   "   8   #   8   $   9   %   9   &   :   '                     .   ????      <       ;       ???                   ;       ???                         ;       ???                           	          ;       ???
            	      
                   ;       ???                         ;       ???                         ;       ???                         ;       ???                         ;       ???                         ;       ???                           	          ;       ???                         ;       ???                         ;       ???                         ;       ???                         ;       ???                                      ;       ???            !      "       ;             ????      #      $         L             ????      %      &       L             ????      '      (      &       L             ????      )      (      &       L              ????      *      &       L       !   !   ????   "   +   #   ,   $   -   %   .   &   /   '          L       !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '          L       !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '          L       !   *   ????   "   +   #   4   $   -   %   5   &   /   '          ;          +   ????         ,   6       U             ????      7       U       !   !   ????   "   8   #   8   $   9   %   9   &   :   '                     /   ????      =       X       ???                   X       ???                         X       ???                           	          X       ???
            	      
                   X       ???                         X       ???                         X       ???                         X       ???                         X       ???                         X       ???                           	          X       ???                         X       ???                         X       ???                         X       ???                         X       ???                                      X       ???            !      "       X             ????      #      $         i             ????      %      &       i             ????      '      (      &       i             ????      )      (      &       i              ????      *      &       i       !   !   ????   "   +   #   ,   $   -   %   .   &   /   '          i       !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '          i       !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '          i       !   *   ????   "   +   #   4   $   -   %   5   &   /   '          X          +   ????         ,   6       r             ????      7       r       !   !   ????   "   8   #   8   $   9   %   9   &   :   '                     0   ????      >       u       ???                   u       ???                         u       ???                           	          u       ???
            	      
                   u       ???                         u       ???                         u       ???                         u       ???                         u       ???                         u       ???                           	          u       ???                         u       ???                         u       ???                         u       ???                         u       ???                                      u       ???            !      "       u             ????      #      $         ?             ????      %      &       ?             ????      '      (      &       ?             ????      )      (      &       ?              ????      *      &       ?       !   !   ????   "   +   #   ,   $   -   %   .   &   /   '          ?       !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '          ?       !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '          ?       !   *   ????   "   +   #   4   $   -   %   5   &   /   '          u          +   ????         ,   6       ?             ????      7       ?       !   !   ????   "   8   #   8   $   9   %   9   &   :   '                     1   ????      ?       ?       ???                   ?       ???                         ?       ???                           	          ?       ???
            	      
                   ?       ???                         ?       ???                         ?       ???                         ?       ???                         ?       ???                         ?       ???                           	          ?       ???                         ?       ???                         ?       ???                         ?       ???                         ?       ???                                      ?       ???            !      "       ?             ????      #      $         ?             ????      %      &       ?             ????      '      (      &       ?             ????      )      (      &       ?              ????      *      &       ?       !   !   ????   "   +   #   ,   $   -   %   .   &   /   '          ?       !   (   ????   "   0   #   ,   $   1   %   .      2   &   /   '          ?       !   )   ????   "   -   #   ,   $   3   %   .      2   &   /   '          ?       !   *   ????   "   +   #   4   $   -   %   5   &   /   '          ?          +   ????         ,   6       ?             ????      7       ?       !   !   ????   "   8   #   8   $   9   %   9   &   :   '                  5   2   ????   3   @   4                  6   6   ????      A   7      8   B             conn_count             conns     $         :   9          8   8   :   9          U   U   :   9          r   r   :   9          ?   ?   :   9          ?   ?   :   9                node_paths              editable_instances              version             RSRC˲?r?p?w?Mextends Node2D
?RSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script /   res://example/Q_Learning/virtual_q_learning.gd ????????      local://PackedScene_7hsmb &         PackedScene          	         names "         virtual_q_learning    script    Node2D    	   variants                       node_count             nodes     	   ????????       ????                    conn_count              conns               node_paths              editable_instances              version             RSRC#g??V|?fɩextends Area2D

@export var state: int = 0
@export var reward_state: bool = false
@export var punishment_state: bool = true
@export var death_state: bool = false

func _ready() -> void:
	if reward_state:
		$color.color = Color.CADET_BLUE
	elif death_state:
		$color.color = Color.DARK_KHAKI
?L?o?MV?n߻RSRC                     PackedScene            ????????                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script "   res://example/Q_Learning/state.gd ????????      local://RectangleShape2D_eculy d         local://PackedScene_be5xm ?         RectangleShape2D       
     ?B  ?B         PackedScene          	         names "         State    script    state    Area2D 
   collision    shape    CollisionShape2D    color    offset_left    offset_top    offset_right    offset_bottom 
   ColorRect    	   variants                                 ?      B   ???>+??=      ??      node_count             nodes     $   ????????       ????                              ????                           ????         	      
                            conn_count              conns               node_paths              editable_instances              version             RSRC???NO????GST2   ?   ?      ????               ? ?        &  RIFF  WEBPVP8L  /??????!"2?H?l?m?l?H?Q/H^??޷???????d??g?(9?$E?Z??ߓ????'3???ض?U?j??$?՜ʝI۶c??3? [???5v?ɶ?=?Ԯ?m???mG??????j?m?m?_?XV????r*snZ'eS?????]n?w?Z:G9?>B?m?It??R#?^?6??($Ɓm+q?h??6?4mb?h3O???$E?s?????A*DV?:#?)??)?X/?x?>@\?0|?q??m֋?d?0ψ?t?!&????P2Z?z??QF+9ʿ?d0??VɬF?F? ???A?????j4BUHp?AI?r??ِ???27ݵ<?=g??9?1??e"e?{?(?(m?`Ec\]?%??nkFC??d???7<?
V?Lĩ>???Qo?<`?M?$x???jD?BfY3?37?W???%?ݠ?5?Au?????WpeU+.v?mj??%' ??ħp?6S?? q??M?׌F?n??w?$$?VI??o?l??m)??Du!SZ??V@9ד]??b=?P3?D??bSU?9?B?????zQmY?M~?M<??Er?8??F)??@`?:7?=??1I]???????3?٭!'??Jn?GS???0&??;?bE?
?
5[I??=i?/??%?̘@?YYL???J?kKvX???S???	?ڊW_?溶?R???S??I??`???֩?Z?T^]1??VsU#f???i??1?Ivh!9+?VZ?Mr?טP?~|"/???IK
g`??MK?????|CҴ?ZQs???fvƄ0e?NN?F-???FNG)???W?2?JN	????????ܕ????2
?~?y#cB???1??YϮ?h?9????m??????v??`g????]1?)?F?^^]Rץ?f??Tk? s?SP?7L?_Y?x?ŤiC?X]??r?>e:	{Sm?ĒT??ubN????k?Yb?;??Eߝ?m??Us?q???1?(\?????Ӈ?b(?7?"?Yme?WY!-)?L???L?6ie??@?Z3D\???\W?c"e???4??AǘH???L??`L?M??G$𩫅?W???FY?gL$NI?'??????I]?r??ܜ??`W<ߛe6ߛ??I>v???W?!a?????????M3???IV??]?yhBҴFlr?!8Մ?^Ҷ?㒸5????I#?I?ڦ???P2R???(?r?a߰z????G~????w?=C?2??????C??{?hWl%??и???O??????;0*??`??U??R??vw?? (7?T#?Ƨ?o7?
?xk͍\dq3a??	x p?ȥ?3>Wc?? ?	??7?kI??9F}?ID
?B???
??v<?vjQ?:a?J?5L&?F?{l??Rh????I??F?鳁P?Nc?w:17??f}u}?Κu@??`? @???????8@`?
?1 ??j#`[?)?8`???vh?p? P???׷?>????"@<?????sv? ????"??Q@,?A??P8??dp{?B??r??X??3??n$?^ ????????^B9??n?????0T?m?2?ka9!?2!???]
?p ZA$\S??~B?O ??;??-|??
{?V??:???o??D??D0\R??k????8??!?I?-???-<??/<JhN??W??1???(?#2:E(*?H???{??>??&!??$| ??~?+\#??8?> ?H???	E#??VY???t7????> 6?"?&ZJ??p?C_j????	P:?~?G0 ?J??$?M???@?Q??Yz??i??~q?1??c??Bߝϟ?n?*??????8j??????p???ox???"w???r?yvz U\F8??<E??xz?i???qi????ȴ?ݷ-r`\?6????Y??q^?Lx?9???#????m????-F?F.-?a?;6??lE?Q??)?P?x?:-?_E?4~v??Z?????䷳?:?n??,㛵??m?=wz?Ξ;2-??[k~v??Ӹ_G?%*?i? ????{?%;????m??g?ez.3???{?????Kv???s ?fZ!:? 4W??޵D??U??
(t}?]5?ݫ߉?~|z??أ?#%???ѝ܏x?D4?4^_?1?g???<??!????t?oV?lm?s(EK͕??K?????n???Ӌ???&?̝M?&rs?0??q??Z??GUo?]'G?X?E????;????=Ɲ?f??_0?ߝfw?!E????A[;???ڕ?^?W"???s5֚??=?+9@??j??????b???VZ^?ltp??f+????Z?6??j?`?L??Za?I??N?0W???Z??????:g??WWjs?#?Y??"?k5m?_????sh\???F%p䬵?6??????\h2lNs?V??#?t?? }?K???Kvzs?>9>?l?+?>??^?n????~Ěg???e~%?w6ɓ??????y??h?DC???b?KG-?d??__'0?{?7????&??yFD?2j~?????ټ?_??0?#??y?9??P????????????f?fj6͙??r?V?K?{[ͮ?;4)O/??az{?<><__????G????[?0???v??G?e????????:???١I???z?M?Wۋ?x?????????u?/??]1=???s??E&?q?l?-P3?{?vI?}??f??}?~??r?r?k?8?{???υ????O?֌ӹ?/?>?}?t	??|???Úq&???ݟW????ᓟwk?9???c̊l??Ui?̸z??f??i???_?j??S-|??w?J?<LծT????-9?????I?®?6 *3??y?[?.Ԗ?K???J???<?ݿ??-t?J???E?63???1R??}Ғbꨝט?l??#???ӴQ??.?S???U
v?&??3?&O???0?9-?O?kK??V_gn??k??U_k˂?4?9?v?I?:;?w&??Q?ҍ?
??fG??B??-????ÇpNk?sZM?s???*??g8??-???V`b????H???
3cU'0hR
?w?XŁ?K݊?MV]?} o?w?tJJ????$꜁x$??l$>?F?EF?޺?G?j?#?G?t?bjj?F?б??q:?`O?4?y?8`Av<?x`??&I[??'A??˚?5??KAn??jx ??=Kn@??t????)?9??=?ݷ?tI??d\?M?j?B?${??G????VX?V6??f?#??V?wk ??W?8?	????lCDZ???ϖ@???X??x?W?Utq?ii?D($?X??Z'8Ay@?s??<?x͡?PU"rB?Q?_?Q6  ??[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cs2q2ydqrdgtf"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
"2??[???ی?3[remap]

path="res://.godot/exported/133200997/export-83d028f6321562d825708289b0a80a6e-Death.scn"
I?R?nh?N*<?[remap]

path="res://.godot/exported/133200997/export-f9947760efac52833f46d5d8e3fb0b8d-End.scn"
[remap]

path="res://.godot/exported/133200997/export-27a9bfcc36efa0e31de48eb447c543a3-NeuralNetworkExample.scn"
Q[?j?ܩz????H?[remap]

path="res://.godot/exported/133200997/export-d05a17cb80496a5ca6811b7b4d79bbec-Player.scn"
??U???`$Y?O[remap]

path="res://.godot/exported/133200997/export-fe3d9fdda054341cc8832459b34044f2-q_learning_example.scn"
?[remap]

path="res://.godot/exported/133200997/export-feba13d392503aaf88b650821b988075-virtual_q_learning.scn"
,[remap]

path="res://.godot/exported/133200997/export-0b195a79d911266da4181d63664e61c5-state.scn"
?AY??K}<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
&y	   ?o?R??F'   res://example/Neural_Network/Death.tscnn??/?3Z%   res://example/Neural_Network/End.tscn݋d?bߜr6   res://example/Neural_Network/NeuralNetworkExample.tscn?dw??6
(   res://example/Neural_Network/Player.tscnD?I?X~%^(   res://example/Neural_Network/Tileset.png???O?{ZV0   res://example/Q_Learning/q_learning_example.tscn5|,???i#   res://example/Q_Learning/state.tscn]-r???T   res://icon.svgU??<???0   res://example/Q_Learning/virtual_q_learning.tscnD?]??K82???ECFG	      _global_script_classes?                    class      
   Activation        language      GDScript      path   3   res://addons/machine_learning/Scripts/Activation.gd       base   
   RefCounted              class         Matrix        language      GDScript      path   /   res://addons/machine_learning/Scripts/Matrix.gd       base   
   RefCounted              class         NeuralNetwork         language      GDScript      path   7   res://addons/machine_learning/Scripts/Neural_Network.gd       base   
   RefCounted              class         NeuralNetworkHelper       language      GDScript      path   >   res://addons/machine_learning/Scripts/Neural_Network_Helper.gd        base   
   RefCounted              class      	   QLearning         language      GDScript      path   3   res://addons/machine_learning/Scripts/Q_Learning.gd       base   
   RefCounted     _global_script_class_icons?            
   Activation               Matrix               NeuralNetwork                NeuralNetworkHelper           	   QLearning             application/config/name$         Machine Learning - Godot 4     application/run/main_scene8      0   res://example/Q_Learning/q_learning_example.tscn   application/config/features$   "         4.0    Forward Plus       application/config/icon         res://icon.svg     display/window/stretch/mode         viewport   display/window/stretch/aspect         expand     editor_plugins/enabled8   "      )   res://addons/machine_learning/plugin.cfg    ?c?