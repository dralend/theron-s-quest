class_name DecisionEngineBasicAttackNoStun
extends DecisionEngine

# Included in DecisionEngine:
# var enemy : Enemy
# var current_state : EnemyState
# var blackboard : Blackboard

@export var attack_state : ESAttack
@export var chase_state : EnemyState

@onready var es_walk: ESWalk = %ESWalk
@onready var es_death: ESDeath = %ESDeath


func _ready() -> void:
	await super()
	pass



# All the conditions for making decisions go in this function
func decide() -> EnemyState:
	# Example decisions
	if blackboard.damage_source:
		if blackboard.health <= 0:
			return es_death
	
	if current_state is ESDeath or not blackboard.can_decide:
		return null
	
	if blackboard.target:
		if attack_state.can_attack():
			return attack_state
		return chase_state
	elif blackboard.edge_detected:
		enemy.change_dir( -blackboard.dir )
	return es_walk # default state
