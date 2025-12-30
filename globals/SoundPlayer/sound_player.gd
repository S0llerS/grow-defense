extends Node

# SFX catalog
const HOVERED = preload("uid://bbvr0wpd2a432")
const PRESSED = preload("uid://dqvo4slhtxovl")

const TRANSITION = preload("uid://dux6ums3x8hu7")

# Logic
var audio_players

func _ready() -> void:
	audio_players = get_children()

func play_sound(sound):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.stream = sound
			audio_player.pitch_scale = randf_range(0.95, 1.05)
			
			audio_player.play()
			
			break
