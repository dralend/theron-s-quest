extends Node

@onready var ability_double_jump: TextureRect = %AbilityDoubleJump
@onready var ability_dash: TextureRect = %AbilityDash
@onready var ability_ground_slam: TextureRect = %AbilityGroundSlam
@onready var ability_morph: TextureRect = %AbilityMorph


func _ready() -> void:
	var player : Player = get_tree().get_first_node_in_group( "Player" )
	#var player : Player = null
	#while player == null:
		#player = get_tree().get_first_node_in_group( "Player" )
		#await get_tree().process_frame
	ability_dash.visible = player.dash
	ability_double_jump.visible = player.double_jump
	ability_ground_slam.visible = player.ground_slam
	ability_morph.visible = player.morph_roll
	pass
