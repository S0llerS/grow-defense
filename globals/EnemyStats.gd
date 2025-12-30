class_name EnemyStats
extends Resource

@export var title : String = "Enemy"
@export var value : int = 1

enum EnemyType { NORMAL, FAST, TANK, RANGED, BOSS }
@export var type : EnemyType = EnemyType.NORMAL

@export var health : int = 10

@export var damage : int = 5
@export var attack_speed : float = 0.8
