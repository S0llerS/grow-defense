class_name Player
extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent

@onready var sprite: Sprite2D = $Sprite

var speed : float = 160.0

# dash
@onready var dash_timer: Timer = %DashTimer
@onready var dash_cooldown_timer: Timer = %DashCooldownTimer

var dash_speed : float = 550.0 # how much is faster than normal speed
var dash_duration : float = 0.2
var dash_cooldown : float = 0.8

var is_dashing : bool = false
var can_dash : bool = true

var dash_direction : Vector2

func _ready() -> void:
	dash_timer.wait_time = dash_duration
	dash_cooldown_timer.wait_time = dash_cooldown
	
	# signals
	health_component.damaged.connect(_on_damaged)
	health_component.destroyed.connect(_on_destroyed)

func _on_damaged():
	pass

func _on_destroyed():
	queue_free()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("dash") and can_dash:
		is_dashing = true
		can_dash = false
		
		dash_direction = direction
		
		dash_timer.start()
	
	if is_dashing:
		velocity = dash_direction * dash_speed
	else:
		velocity = lerp(velocity, direction * speed, 18.0 * delta)
	
	sprite.flip_h = velocity.x > 0
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	is_dashing = false
	dash_cooldown_timer.start()

func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true
