extends Control

@onready var animator: AnimationPlayer = %Animator

func _ready() -> void:
	MusicPlayer.play_music(MusicPlayer.SPACE_AMBIENT)

func transition():
	DiamondTransition.transition_to(Scenes.MAIN)

func _input(_event: InputEvent) -> void:
	if Input.is_anything_pressed() and !DiamondTransition.is_transitioning:
		animator.play("start")

func _on_play_pressed() -> void:
	animator.play("start")
