extends Area2D

@export var state: int = 0
@export var reward_state: bool = false
@export var punishment_state: bool = true
@export var death_state: bool = false

func _ready() -> void:
	if reward_state:
		$color.color = Color.CADET_BLUE
	elif death_state:
		$color.color = Color.DARK_KHAKI
