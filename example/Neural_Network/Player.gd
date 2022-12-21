extends CharacterBody2D

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
